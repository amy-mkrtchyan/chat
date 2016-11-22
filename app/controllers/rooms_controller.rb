class RoomsController < ApplicationController

  before_action :init_policy
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :get_resource, only: [:edit, :show, :update, :destroy]

  def index
    @rooms = @room_policy.get
  end

  def new
    if @room_policy.can_create?
      @room = Room.new
    else
      redirect_to root_url, notice: I18n.translate('active_record.not_permitted')
    end
  end

  def create
    if @room_policy.can_create?
      @room = Room.create!(room_params.merge(created_by: current_user.id))
      message = I18n.translate('active_record.success', resource: 'Room')
    else
      message = I18n.translate('active_record.not_permitted')
    end
    redirect_to root_url, notice: message
  end

  def show
    if @room_policy.can_view?(@room)
      @message = Message.new
    else
      redirect_to root_url, notice: I18n.translate('active_record.not_permitted')
    end
  end

  def edit
    unless @room_policy.can_manage?(@room)
      redirect_to root_url, notice: I18n.translate('active_record.not_permitted')
    end
  end

  def update
    if @room_policy.can_manage?(@room)
      @room.update!(room_params)
      message = 'Room successfully updated!'
    else
      message = I18n.translate('active_record.not_permitted')
    end
    redirect_to root_url, notice: message
  end

  def destroy
    if @room_policy.can_manage?(@room)
      @room.destroy
      message = 'Room successfully deleted!'
    else
      message = I18n.translate('active_record.not_permitted')
    end
    redirect_to root_url, notice: message
  end

  private

  def room_params
    params.require(:room).permit(:id, :name, :private, :avatar)
  end

  def get_resource
    @room = Room.find(params[:id])
  rescue
    redirect_to root_url, notice: I18n.translate('active_record.not_found')
  end

  def init_policy
    @room_policy = RoomPolicy.new(current_user)
  end

end

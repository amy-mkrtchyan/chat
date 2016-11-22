class RoomPolicy

  def initialize(current_user)
    @current_user = current_user
  end

  def get
    @current_user.nil? ? Room.where(private: false) : Room.all
  end

  def can_view?(room)
    @current_user || !room.private?
  end

  def can_create?
    @current_user
  end

  def can_manage?(room)
    @current_user && room.created_by == @current_user.id
  end

end

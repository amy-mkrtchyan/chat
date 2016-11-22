module RoomsHelper

  def is_current_user?(uid)
    current_user.try(:id) == uid
  end

end

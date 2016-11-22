module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :uid

    def connect
      self.uid = request.params[:uid] || ':GUEST:' + SecureRandom.uuid
    end

    # def connect
    #   self.current_user = find_verified_user
    #   logger.add_tags 'ActionCable', current_user.name
    # end


    def guest?
      self.uid.start_with?(':GUEST:')
    end

  end
end

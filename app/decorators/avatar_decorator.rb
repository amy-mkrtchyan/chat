module AvatarDecorator

  def self.included(base)
    base.has_attached_file :avatar, :styles => { thumb: '200x200#' }, default_url: 'missing.png'
    base.validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png image/ico image/gif)
  end

end

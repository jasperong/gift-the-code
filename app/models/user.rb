class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  u = User.new
  u.avatar = params[:file]
  u.avatar = File.open('somewhere')
  u.save!
  u.avatar.url # => '/url/to/file.png'
  u.avatar.current_path # => 'path/to/file.png'
  u.avatar.identifier # => 'file.png'

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end

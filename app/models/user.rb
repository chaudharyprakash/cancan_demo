class User < ActiveRecord::Base
  # attr_accessible :image
  # mount_uploader :images, ImageUploader
  # crop_uploaded :image
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip for image uploading
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default.jpg",
  :processors => [:papercrop]
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  crop_attached_file :image

  before_create :assign_default_role

  def assign_default_role
    self.roles << Role.last
  end


end

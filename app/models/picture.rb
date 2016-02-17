class Picture < ActiveRecord::Base
  acts_as_votable
  belongs_to :album
    # attr_accessible :image
  has_attached_file  :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  self.per_page = 8
end

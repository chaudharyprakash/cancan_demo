class Article < ActiveRecord::Base
  validates :name, presence: true
  validates :published, presence: true
  validates :author, presence: true
  validates :description, presence: true
end

class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  default_scope { order('total_count DESC') }
end

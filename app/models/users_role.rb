class UsersRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  validates_uniqueness_of :user_id
  # validates_uniqueness_of :role_id
end

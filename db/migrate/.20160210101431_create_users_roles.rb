class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|

      t.timestamps null: false
    end
  end
end

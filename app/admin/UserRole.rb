ActiveAdmin.register UsersRole do
  permit_params :user_id, :role_id
  form do |f|
    f.input :user_id, :label => 'User Name ', as: :select, collection: User.all.map { |u| [u.email, u.id] }
    f.input :role_id, :label => 'User Role ', as: :select, collection: Role.all.map { |r| [r.name, r.id] }
    f.actions
  end

  index do
    selectable_column
    column :user do |users|
      users.user.email
    end
    column :role do |user_role|
      user_role.role.name
    end
  end
end
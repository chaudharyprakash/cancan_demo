ActiveAdmin.register Article do
  permit_params :name, :published, :author, :description

  index do
    selectable_column
    id_column
    column :name
    column :published
    column :author
    column :description
    actions
  end
end

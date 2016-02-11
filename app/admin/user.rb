ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :image
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :email
    column "Image" do |user|
      image_tag user.image.url, height: '50', width: '60'
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
end

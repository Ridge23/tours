ActiveAdmin.register City do
  permit_params :name, :iso_name, :code, :enabled, :country
  menu priority: 100
  index do
    selectable_column
    id_column
    column :name
    column :iso_name
    column :code
    column :enabled
    column :country
    actions
  end

  form do |f|
    f.inputs "City Details" do
      f.input :name
      f.input :iso_name
      f.input :code
      f.input :enabled
      f.input :country
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end

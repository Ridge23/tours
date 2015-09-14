ActiveAdmin.register Country do
  permit_params :name, :iso_name, :code, :enabled
  menu priority: 90

  filter :name
  filter :iso_name

end

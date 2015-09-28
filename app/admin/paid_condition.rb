ActiveAdmin.register PaidCondition do
  permit_params :title
  menu priority: 120

  filter :title

end

ActiveAdmin.register AssetType do
  permit_params :title, :published
  menu priority: 110

  filter :title
end

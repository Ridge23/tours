ActiveAdmin.register AssetType do
  permit_params :title, :published
  menu :priority => 110, url: ->{ admin_asset_types_path(locale: I18n.locale) }

  filter :title
end

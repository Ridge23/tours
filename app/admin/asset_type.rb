ActiveAdmin.register AssetType do
  permit_params :title, :published
  menu :priority => 110, label: proc{ I18n.t("active_admin.menu.asset_types") }, url: ->{ admin_asset_types_path(locale: I18n.locale) }

  index do
    selectable_column
    id_column
    column :title
    column :published
    column :updated_at
    column I18n.t("active_admin.dropdown_actions.button_label") do |asset_type|
      link_to(I18n.t("active_admin.view"), admin_asset_type_path(:id => asset_type.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_asset_type_path(:id => asset_type.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_asset_type_path(:id => asset_type.id, :locale => I18n.locale))
    end
  end
  filter :title

  controller do
    before_filter { @page_title =  I18n.t("active_admin.menu.asset_types") }
  end
end

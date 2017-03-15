ActiveAdmin.register AssetMedia do
  menu :priority => 160, label: proc{ I18n.t("active_admin.menu.asset_media") }, url: ->{ admin_asset_media_path(locale: I18n.locale) }

  config.sort_order = 'position_asc'

  filter :title
  filter :asset

  sortable

  index do
    sortable_handle_column
    selectable_column
    id_column
    column :title
    column :asset_id
    column :enabled
    column :updated_at
    column I18n.t("active_admin.dropdown_actions.button_label") do |asset_media|
      link_to(I18n.t("active_admin.view"), admin_asset_medium_path(:id => asset_media.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_asset_medium_path(:id => asset_media.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_asset_medium_path(:id => asset_media.id, :locale => I18n.locale))
    end
  end

  form do |f|
    f.inputs "Asset Media" do
      f.input :title
      f.input :description
      f.input :asset, :as => :select, :collection => option_groups_from_collection_for_select(City.all, :assets, :name, :id, :name, f.object.asset ? f.object.asset.id : 0)
      f.input :enabled
      f.input :media_file, :as => :file, :hint => f.object.media_file.url
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    before_filter { @page_title =  I18n.t("active_admin.menu.asset_media") }
  end
end

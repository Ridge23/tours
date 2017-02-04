ActiveAdmin.register AssetImage do
  menu :priority => 140, label: proc{ I18n.t("active_admin.menu.asset_images") }, url: ->{ admin_asset_images_path(locale: I18n.locale) }

  filter :title
  filter :asset

  index do
    selectable_column
    id_column
    column :title
    column :asset_id
    column :enabled
    column :updated_at
    column I18n.t("active_admin.dropdown_actions.button_label") do |asset_image|
      link_to(I18n.t("active_admin.view"), admin_asset_image_path(:id => asset_image.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_asset_image_path(:id => asset_image.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_asset_image_path(:id => asset_image.id, :locale => I18n.locale))
    end
  end

  form do |f|
    f.inputs "Asset Image" do
      f.input :title
      f.input :description
      f.input :asset, :as => :select, :collection => option_groups_from_collection_for_select(City.all, :assets, :name, :id, :name, f.object.asset ? f.object.asset.id : 0)
      f.input :enabled
      f.input :image_file, :as => :file, :hint => image_tag(f.object.image_file.url(:thumb))
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    before_filter { @page_title =  I18n.t("active_admin.menu.asset_images") }
  end
end

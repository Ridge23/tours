ActiveAdmin.register City do
  permit_params :name, :iso_name, :code, :enabled, :country
  menu :priority => 100, label: proc{ I18n.t("active_admin.menu.cities") }, url: ->{ admin_cities_path(locale: I18n.locale) }
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :enabled
    column :country
    column I18n.t("active_admin.dropdown_actions.button_label") do |city|
      link_to(I18n.t("active_admin.view"), admin_city_path(:id => city.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_city_path(:id => city.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_city_path(:id => city.id, :locale => I18n.locale))
    end
  end

  form do |f|
    f.inputs "City Details" do
      f.input :name
      f.input :country
      f.input :price
      f.input :enabled
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :country
      row :price
      row :enabled
    end
  end

  filter :country
  filter :name
  filter :price
  filter :enabled

  controller do
    def permitted_params
      params.permit!
    end
  end

end

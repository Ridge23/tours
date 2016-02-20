ActiveAdmin.register City do
  permit_params :name, :iso_name, :code, :enabled, :country
  menu :priority => 100, url: ->{ admin_cities_path(locale: I18n.locale) }
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :code
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
      f.input :iso_name
      f.input :code
      f.input :enabled
      f.input :country
      f.input :price
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end

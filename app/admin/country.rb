ActiveAdmin.register Country do
  permit_params :name, :iso_name, :code, :enabled
  menu :priority => 90, label: proc{ I18n.t("active_admin.menu.countries") }, url: ->{ admin_countries_path(locale: I18n.locale) }

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :iso_name
    column :enabled
    column I18n.t("active_admin.dropdown_actions.button_label") do |country|
      link_to(I18n.t("active_admin.view"), admin_country_path(:id => country.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_country_path(:id => country.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_country_path(:id => country.id, :locale => I18n.locale))
    end
  end

  filter :name
  filter :iso_name

end

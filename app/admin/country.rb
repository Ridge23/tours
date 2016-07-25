ActiveAdmin.register Country do
  permit_params :name, :iso_name, :code, :enabled
  menu :priority => 90, label: proc{ I18n.t("active_admin.menu.countries") }, url: ->{ admin_countries_path(locale: I18n.locale) }

  index do
    selectable_column
    id_column
    column :name
    column :iso_name
    column :enabled
    column I18n.t("active_admin.dropdown_actions.button_label") do |country|
      link_to(I18n.t("active_admin.view"), admin_country_path(:id => country.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_country_path(:id => country.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_country_path(:id => country.id, :locale => I18n.locale))
    end
  end

  form do |f|
    f.inputs "Country Details" do
      f.input :name
      f.input :iso_name
      f.input :enabled
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :iso_name
      row :enabled
    end
  end

  filter :name
  filter :iso_name

  controller do
    before_filter { @page_title =  I18n.t("active_admin.menu.countries") }
  end

end

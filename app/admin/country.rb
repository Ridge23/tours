ActiveAdmin.register Country do
  permit_params :name, :iso_name, :code, :enabled
  menu :priority => 90, url: ->{ admin_countries_path(locale: I18n.locale) }

  filter :name
  filter :iso_name

end

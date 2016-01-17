ActiveAdmin.register PaidCondition do
  permit_params :title
  menu :priority => 120, url: ->{ admin_paid_conditions_path(locale: I18n.locale) }


  filter :title

end

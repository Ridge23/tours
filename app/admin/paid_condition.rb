ActiveAdmin.register PaidCondition do
  permit_params :title
  menu :priority => 120, label: proc{ I18n.t("active_admin.menu.paid_conditions") }, url: ->{ admin_paid_conditions_path(locale: I18n.locale) }
  index do
    selectable_column
    id_column
    column :title
    column :enabled
    column :created_at
    column :updated_at
    column I18n.t("active_admin.dropdown_actions.button_label") do |paid_condition|
      link_to(I18n.t("active_admin.view"), admin_paid_condition_path(:id => paid_condition.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_paid_condition_path(:id => paid_condition.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_paid_condition_path(:id => paid_condition.id, :locale => I18n.locale))
    end
  end

  filter :title

end

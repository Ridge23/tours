ActiveAdmin.register AdminUser do
  menu :priority => 2, label: proc{ I18n.t("active_admin.menu.admin_users") }, url: ->{ admin_admin_users_path(locale: I18n.locale) }
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column I18n.t("active_admin.dropdown_actions.button_label") do |user|
      link_to(I18n.t("active_admin.view"), admin_admin_user_path(:id => user.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_admin_user_path(:id => user.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_admin_user_path(:id => user.id, :locale => I18n.locale))
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

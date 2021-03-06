ActiveAdmin.register User do
  menu :priority => 3, label: proc{ I18n.t("active_admin.menu.users") }, url: ->{ admin_users_path(locale: I18n.locale) }
  permit_params :email, :password, :password_confirmation, :api_token

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :api_token
    column I18n.t("active_admin.dropdown_actions.button_label") do |user|
      link_to(I18n.t("active_admin.view"), admin_user_path(:id => user.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_user_path(:id => user.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_user_path(:id => user.id, :locale => I18n.locale))
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :authentication_token
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    before_filter { @page_title =  I18n.t("active_admin.menu.users") }
  end

end

ActiveAdmin.register Asset do
  menu :priority => 130, label: proc{ I18n.t("active_admin.menu.assets") }, url: ->{ admin_assets_path(locale: I18n.locale) }

  filter :name
  filter :country
  filter :city
  filter :asset_type
  filter :paid_condition

  index do
    selectable_column
    id_column
    column :name
    column :country
    column :city
    column :paid_condition
    column :asset_type
    column I18n.t("active_admin.dropdown_actions.button_label") do |user|
      link_to(I18n.t("active_admin.view"), admin_asset_path(:id => user.id, :locale => I18n.locale )) + " | " + \
      link_to(I18n.t("active_admin.edit"), edit_admin_asset_path(:id => user.id, :locale => I18n.locale)) + " | " + \
      link_to(I18n.t("active_admin.delete"), admin_asset_path(:id => user.id, :locale => I18n.locale))
    end
  end

  form do |f|
    f.inputs "Asset" do
      f.input :name
      f.input :country, :input_html => {
                          :onchange => remote_request(:get, dynamic_select_cities_path, { :country_id => "$('#asset_country_id').val()" }, :asset_city_id)
                      }
      f.input :city, collection: City.where(:country_id => asset.country_id)
      f.input :paid_condition
      f.input :asset_type
      f.input :audio_file, :as => :file, :hint => f.object.audio_file.url
      f.input :audio_duration, :input_html => { :disabled => true }
      f.input :remove_audio, as: :boolean, required: false, label: "Remove Audio"
      f.input :text, :input_html => { :class => "tinymce" }, :as => :text
      f.input :latitude
      f.input :longitude
      f.input :thumbnail, :as => :file, :hint => image_tag(f.object.thumbnail.url(:thumb))
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    def change_cities
      @cities = City.find_by_id(params[:country_id]).try(:cities)
      render :text => view_context.options_from_collection_for_select(@cities, :id, :name)
    end
  end

  controller do
    before_filter { @page_title =  I18n.t("active_admin.menu.assets") }
  end

end
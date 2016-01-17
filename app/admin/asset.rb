ActiveAdmin.register Asset do
  menu priority: 130

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
    actions
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
      f.input :audio_file
      f.input :text_file
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

end
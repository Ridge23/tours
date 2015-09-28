class DynamicSelectsController < ApplicationController
  def cities
    @cities = City.where(:country_id => params[:country_id])
    if(@cities)
      render :text => view_context.options_from_collection_for_select(@cities, :id, :name)
    else
      render :text => 'no cities found'
    end
  end
end

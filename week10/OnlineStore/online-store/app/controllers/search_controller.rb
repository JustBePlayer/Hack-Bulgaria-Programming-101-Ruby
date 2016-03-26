class SearchController < ApplicationController
  def by_type
    render json: Search.by_type_and_property(*search_params.values)
  end


  def search_params
    params.permit(:type, :property, :slug)
  end
end

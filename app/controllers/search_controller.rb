class SearchController < ApplicationController
  def index
    zip_code = params[:search]
    @stores = Store.find_near_zipcode(zip_code)
  end
end

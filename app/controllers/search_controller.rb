class SearchController < ApplicationController
  def index
    @stores = Store.find_near_zipcode(params[:zip_code])
  end
end

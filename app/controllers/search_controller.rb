class SearchController < ApplicationController
  def index
    zip_code = params[:search]
    @store_count = Store.find_near_zipcode(zip_code).count
    @stores = Store.find_near_zipcode(zip_code).paginate(:page => params[:page], :per_page => 10)
  end
end

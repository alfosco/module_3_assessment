class SearchController < ApplicationController
  def index
    @stores = Store.find_near_zipcode(params[:search])
  end
end

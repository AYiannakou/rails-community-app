class SearchController < ApplicationController
  def index
    @results = Micropost.search(params[:query]) unless params[:query].blank?
   end
end

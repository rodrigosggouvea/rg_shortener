class UrlsController < ApplicationController
  def create
    @url = params.require(:url).permit(:long)
  end
end

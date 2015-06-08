class UrlsController < ApplicationController
  def create
    url = params.require(:url).permit(:long)
    @url = Shortener::ShortenedUrl.generate(url[:long])
  end
end

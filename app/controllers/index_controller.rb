class IndexController < ApplicationController
  def show
    @banners = BannerImg.order("2")
  end
end

class IndexController < ApplicationController
  def show
    @banners = Admin::BannerImg.order("2")
  end
end

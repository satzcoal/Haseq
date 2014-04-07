class IndexController < ApplicationController
  def show
    @banners = BannerImg.order('nindex')
  end
end

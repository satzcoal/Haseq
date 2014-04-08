class IndexController < ApplicationController
  def show
    @banners = BannerImg.order('nindex')
    @newposts = Product.where('isshowindex = \'t\'')
    @newtnewses = Tnews.where('isshowindex = \'t\'')
  end
end

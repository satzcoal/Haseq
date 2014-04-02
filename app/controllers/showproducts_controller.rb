class ShowproductsController < ApplicationController
  def productlist
    @cat_id = params[:catid]
    @products = Product.all
    @catalogs = Catalog.order('1')
  end
end

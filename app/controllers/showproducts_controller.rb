class ShowproductsController < ApplicationController
  def productlist
    @cat_id = params[:catid]
    @products = Product.all
    @catalogs = Catalog.order('nindex')
  end

  def show
    @product = Product.find(params[:id])
  end
end

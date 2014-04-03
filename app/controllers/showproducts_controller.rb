class ShowproductsController < ApplicationController
  def productlist
    @cat_id = params[:catid]
    @products = Admin::Product.all
    @tmp = @products.first().__id__
    @catalogs = Admin::Catalog.order('1')
  end

  def show
    @product = Admin::Product.find(params[:id])
  end
end

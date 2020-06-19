class Potepan::ProductsController < ApplicationController
  RELATED_PRODUCTS_LIMIT = 4
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = Spree::Product.in_taxons(@product.taxons).price_and_image.
      without_product(@product).distinct.sample(RELATED_PRODUCTS_LIMIT)
  end
end

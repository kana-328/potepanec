class Potepan::ProductsController < ApplicationController
  RELATED_PRODUCTS_LIMIT = 4
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = Spree::Product.add_price_image.joins(:taxons, :classifications)
                                      .distinct.related_products(@product).without_self(@product).sample(RELATED_PRODUCTS_LIMIT)

  end
end

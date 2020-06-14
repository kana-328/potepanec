class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.find(params[:id])
    @taxon_ids = @product.taxon_ids
    @related_products = Spree::Product.add_price_image.joins(:taxons, :classifications).limit(4)
                        .distinct.related_products(@product).without_self(@product).shuffle
  end
end

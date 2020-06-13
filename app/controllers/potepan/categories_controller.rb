class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.all_products.add_price_image
    @taxonomies = Spree::Taxon.roots
  end
end

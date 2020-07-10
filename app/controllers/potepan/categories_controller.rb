class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.all_products.with_prices_and_images
    @taxonomies = Spree::Taxon.roots
  end
end

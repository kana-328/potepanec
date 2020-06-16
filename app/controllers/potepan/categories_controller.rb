class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.all_products.price_and_image
    @taxonomies = Spree::Taxon.roots
  end
end

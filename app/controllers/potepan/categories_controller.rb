class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.all_products.includes(master: [:default_price, :images])
    @taxonomies = Spree::Taxon.roots
  end
end

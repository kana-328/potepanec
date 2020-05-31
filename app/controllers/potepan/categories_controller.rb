class Potepan::CategoriesController < ApplicationController

  def show
    @product = Spree::Product.all
    @taxon = Spree::Taxon.find(params[:id])
    @categories = Spree::Taxon.find(1)
    @taxonomies = Spree::Taxonomy.all
    @brand = Spree::Taxon.find(2)

  end
end

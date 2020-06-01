class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @product = Spree::Product.find_by(id: @taxon.id)
    @categories = Spree::Taxon.find(1)
    @brand = Spree::Taxon.find(2)
    @taxonomy = Spree::Taxonomy.in_list
  end
end

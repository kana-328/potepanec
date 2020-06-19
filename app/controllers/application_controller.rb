class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def suggestion
    @product = Spree::Product.where('name LIKE ?', '%#{params[:query]}%').limit(5)
    render json: @product
  end
end

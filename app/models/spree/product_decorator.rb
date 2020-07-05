module Spree::ProductDecorator
  def self.prepended(base)
    base.scope :with_prices_and_images, -> { includes(master: [:default_price, :images]) }
    base.scope :without_product, ->(id) { base.where.not(spree_products: { id: id }) }
  end
  Spree::Product.prepend self
end

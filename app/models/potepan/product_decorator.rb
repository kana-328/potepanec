module Spree::ProductDecorator

Spree::Product.class_eval do
  scope :add_price_image, -> { includes(master: [:default_price, :images]) }
  scope :without_self, -> (product) { where.not(spree_products:{ id: product.id }) }
  scope :related_products, -> (product) { where(classifications_spree_products:{ taxon_id: product.taxon_ids }) }
end
  Spree::Product.prepend self
end

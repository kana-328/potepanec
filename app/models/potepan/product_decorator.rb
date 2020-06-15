module Spree::ProductDecorator
  def self.prepended(base)
    base.scope :add_price_image, -> { includes(master: [:default_price, :images]) }
    base.scope :without_self, ->(id) { base.where.not(spree_products:{ id: id }) }
    base.scope :related_products, ->(product) { base.where(classifications_spree_products: { taxon_id: product.taxon_ids }) }
  end
  Spree::Product.prepend self
end

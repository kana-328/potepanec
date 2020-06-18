require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :model do
  describe 'scope' do
    describe 'without_product' do
      let(:product) { create(:product) }
      subject { Spree::Product.without_product(product.id) }
      it { is_expected.to_not eq product }
    end
  end
end

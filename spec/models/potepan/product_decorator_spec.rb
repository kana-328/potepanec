require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :model do
  describe 'scope' do
    describe 'without_product' do
      subject { Spree::Product.without_product(product.id) }

      let(:product) { create(:product) }

      it { is_expected.not_to eq product }
    end
  end
end

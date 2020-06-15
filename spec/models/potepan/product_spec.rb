require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :model do

  describe 'scope' do

    describe 'without_self' do
      let(:product) { create(:product) }
      subject { Spree::Product.without_self(product) }
      it { is_expected.to_not include product }
    end

    describe 'related_products' do
      let(:taxonomy) { create(:taxonomy, name: 'Categries') }
      let(:product) { create(:product, name: 'tote', taxon_ids: taxon.id) }
      let(:taxon) { create(:taxon, name: 'Bag', taxonomy_id: taxonomy, parent_id: taxonomy) }
      let(:related) { create(:product, name: 'testitem', taxons: [taxon]) }

      subject { Spree::Product.joins(:taxons, :classifications).related_products(product) }
      it { is_expected.to include related }
      it { is_expected.to include product }
    end
  end
end

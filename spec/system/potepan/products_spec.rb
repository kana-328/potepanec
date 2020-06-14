require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :system do

  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon, taxonomy: taxonomy) }
  let(:product) { create(:product, taxons: [taxon]) }
  let(:other_taxon) { create(:taxon, taxonomy: taxonomy) }
  let!(:related_products) { create(:product, name: 'testitem', taxons: [taxon]) }
  let!(:notrelated_product) { create(:product, name: 'notrelated', taxons: [other_taxon]) }

  before do
    driven_by(:rack_test)
    visit potepan_product_path(product.id)
  end

  it '一覧ページへ戻るを押すとカテゴリー別商品一覧ページが表示される' do
    click_on '一覧ページへ戻る'
    expect(current_path).to eq potepan_category_path(taxon.id)
  end

  it '関連商品をクリックすると商品詳細ページが表示される' do
    click_on related_products.name
    expect(current_path).to eq potepan_product_path(related_products.id)
  end
end

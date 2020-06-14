require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:taxon) { create(:taxon) }
  let(:product) { create(:product, taxons: [taxon]) }
  let(:related_products) { create_list(:product, 4, name: 'testitem', taxons: [taxon]) }

  it '一覧ページへ戻るを押すとカテゴリー別商品一覧ページが表示される' do
    visit potepan_product_path(product.id)
    click_on '一覧ページへ戻る'
    expect(current_path).to eq potepan_category_path(taxon.id)
  end

  it 'related_productsをクリックすると@product' do
    visit potepan_product_path(product.id)
    click_on related_products.first.name
    expect(page).to have_content product.name
  end
end

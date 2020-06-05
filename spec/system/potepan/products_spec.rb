require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:taxon) { create(:taxon, id: 1) }
  let(:product) { create(:product, taxon_ids: taxon.id) }

  it '一覧ページへ戻るを押すとカテゴリー別商品一覧ページが表示される' do
    visit potepan_product_path(product.id)
    click_on '一覧ページへ戻る'
    expect(current_path).to eq potepan_category_path(taxon.id)
  end
end

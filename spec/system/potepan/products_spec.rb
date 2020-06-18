require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :system do

  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon, taxonomy: taxonomy) }
  let(:product) { create(:product, taxons: [taxon]) }
  let(:other_taxon) { create(:taxon, taxonomy: taxonomy) }
  let!(:related_product) { create(:product, name: 'testitem', taxons: [taxon]) }
  let!(:notrelated_product) { create(:product, name: 'notrelated', taxons: [other_taxon]) }

  before do
    driven_by(:rack_test)
    visit potepan_product_path(product.id)
  end

  it '商品ページに商品詳細、料金、関連商品が表示され関連してない商品は表示されない' do
    within(:css, '.media-body') do
      expect(page).to have_content product.display_price.to_s
      expect(page).to have_content product.description
    end
    within(:css, '.productCaption') do
      expect(page).to have_content related_product.name
      expect(page).to_not have_content notrelated_product.name
    end
  end

  it '一覧ページへ戻るを押すとカテゴリー別商品一覧ページが表示される' do
    click_on '一覧ページへ戻る'
    expect(current_path).to eq potepan_category_path(taxon.id)
  end

  it '関連商品をクリックすると商品詳細ページが表示される' do
    click_on related_product.name
    expect(current_path).to eq potepan_product_path(related_product.id)
  end
end

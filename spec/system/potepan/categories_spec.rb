require 'rails_helper'
RSpec.describe 'Potepan::Categries', type: :system do
  before do
    driven_by(:rack_test)
    visit potepan_category_path(product.taxons.first.id)
  end

  let!(:taxonomy) { create(:taxonomy, name: 'Categries') }
  let!(:product) { create(:product, name: 'tote', taxon_ids: taxon.id) }
  let!(:taxon) { create(:taxon, name: 'Bag', taxonomy_id: taxonomy, parent_id: taxonomy) }

  it 'カテゴリー名をクリックするとカテゴリー別商品一覧ページが表示される' do
    click_on taxon.name
    expect(current_path).to eq potepan_category_path(taxon.id)
  end

  it 'Categorieをクリックするとカテゴリー名が表示される' do
    click_on taxonomy.name
    expect(page).to have_content taxon.name
  end
end

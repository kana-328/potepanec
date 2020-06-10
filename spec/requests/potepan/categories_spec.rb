require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :request do

  let(:taxonomy) { create(:taxonomy, name: 'Categries') }
  let(:product) { create(:product, name: 'tote', taxon_ids: taxon.id) }
  let(:taxon) { create(:taxon, name: 'Bag', taxonomy_id: taxonomy, parent_id: taxonomy) }
  let(:other_product) { create(:product, name: 'mug', taxon_ids: other_taxon.id) }
  let(:other_taxon) { create(:taxon, name: 'Mug', taxonomy_id: taxonomy, parent_id: taxonomy) }

  before do
    get potepan_category_path(product.taxons.first.id)
  end

  it 'リクエストが成功すること' do
    expect(response.status).to eq 200
  end

  it '正常にアクセスされ商品カテゴリーとカテゴリー名と商品が表示される' do
    expect(response).to have_http_status(:success)
    expect(response.body).to include '商品カテゴリー'
    expect(response.body).to include taxon.name
    expect(response.body).to include product.name
    expect(response.body).to include taxonomy.name
  end

  it '他のカテゴリー商品は表示されていない' do
    expect(response.body).to include product.name
    expect(response.body).to_not include other_product.name
    expect(response.body).to_not include other_taxon.name
  end
end

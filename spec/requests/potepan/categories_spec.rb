require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :request do
  let(:product) { create(:product, taxon_ids: taxon.id) }
  let(:taxon) { create(:taxon, id: 1) }

  describe 'GET /show' do
    it 'showページが正常にアクセスされ商品カテゴリーとカテゴリー名が表示される' do
      get potepan_category_path(product.taxons.first.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include '商品カテゴリー'
      expect(response.body).to include taxon.name
    end
  end
end

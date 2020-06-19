require 'rails_helper'

RSpec.describe 'Potepan::Products', type: :request do
  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon) }
  let(:product) { create(:product, taxon_ids: taxon.id) }
  let!(:related_products) { create_list(:product, 5, name: 'testitem', taxons: [taxon]) }

  before do
    get potepan_product_path(product.id)
  end

  describe 'GET /show' do
    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it '@productに期待する値が入っている' do
      expect(assigns(:product)).to eq product
    end

    it 'showページに正常にアクセスされる' do
      expect(response).to have_http_status(:success)
    end

    it '関連している商品の期待する数が表示される' do
      expect(assigns(:related_products).size).to eq 4
    end
  end
end

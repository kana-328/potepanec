require 'rails_helper'

RSpec.describe 'Potepan::Products', type: :request do

  let(:taxon) { create(:taxon, id: 1) }
  let(:product) { create(:product, taxon_ids: taxon.id) }
  let(:related_products) { create_list(:product, 4, taxon_ids: taxon.id) }

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

    it 'showページに正常にアクセスされ、商品、料金が表示される' do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include product.display_price.to_s
      expect(response.body).to include product.description
      expect(response.body).to include related_products.name
    end
  end
end

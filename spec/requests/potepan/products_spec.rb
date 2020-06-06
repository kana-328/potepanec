require 'rails_helper'

 RSpec.describe 'Potepan::Products', type: :request do

  let(:taxon) { create(:taxon, id: 1) }
  let(:product) { create(:product, taxon_ids: taxon.id) }

  describe 'GET /show' do
    it 'showページに正常にアクセスされ、商品、料金が表示される' do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include '$19.99'
      expect(response.body).to include 'As seen on TV!'
    end
  end
end

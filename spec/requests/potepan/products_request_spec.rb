require 'rails_helper'
RSpec.describe 'Potepan::Products', type: :request do
  let!(:product) { create(:product, name: 'Tote') }
  describe 'GET /index' do
    it 'indexページに正常にアクセスされる' do
      get potepan_path
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /show' do
    it 'showページに正常にアクセスされ、タイトル、料金が表示される' do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include '$19.99'
      expect(response.body).to include 'As seen on TV!'
    end
  end
end

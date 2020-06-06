require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do

  describe 'GET #show' do
    let(:product) { create(:product) }

    before do
      get :show, params: { id: product.id }
    end

    it 'showページにレンダリングされる' do
      expect(response).to render_template :show
    end

    it '@productに期待する値が入っている' do
      expect(assigns(:product)).to eq product
    end
  end
end

require 'rails_helper'
RSpec.describe Potepan::CategoriesController, type: :controller do
  describe 'GET #show' do
    let(:taxon) { create(:taxon) }

    before do
      get :show, params: { id: taxon.id }
    end

    it 'showページにレンダリングされる' do
      expect(response).to render_template :show
    end

    it '正常なレスポンスである' do
      expect(response).to have_http_status(:success)
    end

    it '@taxonに期待する値が入っている' do
      expect(controller.instance_variable_get('@taxon').name).to eq 'Ruby on Rails'
    end
  end
end

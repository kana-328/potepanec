require 'rails_helper'
include ApplicationHelper
RSpec.describe ApplicationHelper, type: :helper do
  describe 'ページタイトル' do
    context '@product.nameがなかったら' do
      it 'base_titleだけが表示される' do
        expect(helper.full_title('')).to eq('BIGBAG Store')
      end
    end
    context '@product.nameがあったら' do
      it '@product.nameとbase_titleが表示される' do
        expect(helper.full_title('Tote')).to eq('Tote - BIGBAG Store')
      end
    end
  end
end

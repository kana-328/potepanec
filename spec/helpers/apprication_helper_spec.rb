require 'rails_helper'
include ApplicationHelper
RSpec.describe ApplicationHelper, type: :helper do
  describe 'ページタイトル' do
    context 'base_titleだけが表示される場合' do
      it '@product.nameは空である' do
        expect(helper.full_title('')).to eq('BIGBAG Store')
      end
      it '@product.nameはnilである' do
        expect(helper.full_title(nil)).to eq('BIGBAG Store')
      end
    end
    context '@product.nameとbase_titleが表示される場合' do
      it 'page_titleに@product.nameがある' do
        expect(helper.full_title('Tote')).to eq('Tote - BIGBAG Store')
      end
    end
  end
end

require 'rails_helper'

include ApplicationHelper
RSpec.describe ApplicationHelper, type: :helper do
  describe 'ページタイトル' do
    context '@product.nameが空白の場合' do
      it 'base_titleだけが表示される' do
        expect(helper.full_title('')).to eq('BIGBAG Store')
      end
    end

    context '@product.nameがnilの場合' do
      it 'base_titleだけが表示される' do
        expect(helper.full_title(nil)).to eq('BIGBAG Store')
      end
    end

    context '@product.nameに値が入っている場合' do
      it 'base_titleと@product.nameが表示される' do
        expect(helper.full_title('Tote')).to eq('Tote - BIGBAG Store')
      end
    end
  end
end

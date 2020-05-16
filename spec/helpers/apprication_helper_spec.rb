require 'rails_helper'
include ApplicationHelper
RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    context 'page_titleが空だったら' do
      it 'タイトルだけ' do
        expect(helper.full_title('')).to eq('BIGBAG Store')
      end
    end
    context 'page_titleが空じゃなかったら' do
      it 'アクションネームとタイトルが入る' do
        expect(helper.full_title('Tote')).to eq('Tote - BIGBAG Store')
      end
    end
  end
end

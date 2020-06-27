require 'rails_helper'
RSpec.describe 'Potepan::Suggests', type: :request do
  it '200 0Kを返す' do
    json = JSON.parse(response.body)
  end

  it '成功時のJSONレスポンスを返す' do 
  end

  it '500レスポンスを返す' do
  end
end
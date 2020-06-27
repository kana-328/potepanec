require 'rails_helper'
require 'httpclient'
require 'webmock'
include WebMock::API
WebMock.enable!
RSpec.describe 'Potepan::Suggests', type: :request do

before do
  stub_request(:any, ENV['API_SUGGEST_URL']).to_return(
    :status => 200,
    :headers => {"keyword": "r", "max_num": 5},
    :body => 'ruby'
  )
  http = HTTPClient.new
  response = http.get ENV['API_SUGGEST_URL']
end

  it '200 0Kを返す' do
    expect(response.status).to eq 200
  end

  it '成功時のJSONレスポンスを返す' do 
  end

  it '500レスポンスを返す' do
  end
end
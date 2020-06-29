require 'rails_helper'
require 'httpclient'
RSpec.describe 'Potepan::Suggests', type: :request do
  WebMock.allow_net_connect!

  client = HTTPClient.new
  uri = ENV['API_SUGGEST_URL']
  headers = { "Authorization": ENV['API_KEY'], "Content-Type": "application/json" }

  it "正常なresponseの場合200レスポンスが返ってくる" do
    query = { "keyword": "r", "max_num": 5 }
    response = client.get(uri, query, headers)
    expect(response.status).to eq 200
    expect(response.reason).to eq 'OK'
  end

  it "responseに期待するbodyの配列が入っている" do
    query = { "keyword": "r", "max_num": 5 }
    response = client.get(uri, query, headers)
    expect(JSON.parse(response.body)).to eq ["ruby", "ruby for women", "ruby for men", "rails", "rails for women"]
  end

  it "エラーの際500レスポンスが返ってきてメッセージが表示される" do
    query = { "max_num": 5 }
    response = client.get(uri, query, headers)
    expect(response.status).to eq 500
    expect(response.reason).to eq 'Internal Server Error'
  end
end

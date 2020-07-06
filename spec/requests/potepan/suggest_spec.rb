require 'rails_helper'
require 'httpclient'
require 'webmock/rspec'

RSpec.describe 'Potepan::Suggests', type: :request do
  context "正常なアクセスの時" do
    before do
      WebMock.enable!
      WebMock.stub_request(:get, ENV['API_SUGGEST_URL']).
        with(
          headers: { "Authorization": "Bearer #{ENV['API_KEY']}", "Content-Type": "application/json" },
          query: { "keyword": "r", "max_num": 5 }
        ).to_return(
          headers: { "Content-Type": "application/json" },
          status: 200,
          body: ["ruby", "ruby for women", "ruby for men", "rails", "rails for women"].to_json
        )
    end

    it 'status:200がレスポンスで返ってきてbodyに期待する値が入っている' do
      get potepan_suggests_path params: { keyword: "r", max_num: 5 }
      expect(response).to have_http_status(:success)
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq ["ruby", "ruby for women", "ruby for men", "rails", "rails for women"]
    end
  end

  context "アクセスに異常が出た時" do
    before do
      WebMock.enable!
      WebMock.stub_request(:get, ENV['API_SUGGEST_URL']).
        with(
          headers: { "Content-Type": "application/json" },
          query: { "keyword": "r", "max_num": 5 }
        ).to_return(
          headers: { "Content-Type": "application/json" },
          status: 500,
          body: ["ruby", "ruby for women", "ruby for men", "rails", "rails for women"].to_json
        )
    end

    it "status:500がレスポンスで返ってくる" do
      get potepan_suggests_path params: { keyword: "r", max_num: 5 }
      expect(response).not_to have_http_status(:success)
      expect(response.status).to eq 500
    end
  end
end

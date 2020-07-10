require 'rails_helper'
require 'httpclient'
require 'webmock/rspec'
RSpec.describe 'Potepan::Suggests', type: :request do
  before do
    WebMock.enable!
    WebMock.stub_request(:get, ENV['API_SUGGEST_URL']).with(
      headers: headers,
      query: { 'keyword' => query_keyword, 'max_num' => 5 }
    ).to_return(
      body: return_body,
      status: return_status,
      headers: headers
    )
    get potepan_suggests_path params: { keyword: 'r', max_num: 5 }
  end

  context 'webAPIから返ってくるレスポンスが正常な場合' do
    let(:headers) { { 'Authorization' => "Bearer #{ENV['API_KEY']}", "Content-Type": "application/json" } }
    let(:query_keyword) { 'r' }
    let(:return_body) { ["ruby", "ruby for women", "ruby for men", "rails", "rails for women"].to_json }
    let(:return_status) { 200 }

    it 'status:200がレスポンスで返ってくる' do
      expect(return_status).to eq 200
    end

    it 'bodyに期待する値が入っている' do
      expect(JSON.parse(return_body)).to eq ["ruby", "ruby for women", "ruby for men", "rails", "rails for women"]
    end
  end

  context "アクセスに異常が出た時" do
    let(:headers) { { "Content-Type": "application/json" } }
    let(:query_keyword) { "r" }
    let(:return_body) { "error" }
    let(:return_status) { 500 }

    it "status:500がレスポンスで返ってくる" do
      expect(return_status).to eq 500
    end
  end
end

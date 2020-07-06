class Potepan::SuggestsController < ApplicationController
  require "./lib/client/api_request"
  def show
    url = ENV['API_SUGGEST_URL']
    query = { keyword: params[:keyword], max_num: 5 }
    headers = { Authorization: "Bearer #{ENV['API_KEY']}", "Content-Type": "application/json" }
    response = Client::ApiRequest.suggest(url, query, headers)
    status = response.status
    if status == 200
      render json: response.body
    else
      render json: {
        error: "エラーが発生しています。管理者に確認してください。",
      }, status: 500
    end
  end
end

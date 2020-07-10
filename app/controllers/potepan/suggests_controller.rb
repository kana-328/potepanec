class Potepan::SuggestsController < ApplicationController
  require "./lib/client/api_request"
  def show
    response = Client::ApiRequest.suggest(params[:keyword], params[:max_num])
    if response.status == 200
      render json: response.body
    else
      logger.error { "response: #{response.inspect}" }
      render json: {
        error: "エラーが発生しています。管理者に確認してください",
      }, status: 500
    end
  end
end

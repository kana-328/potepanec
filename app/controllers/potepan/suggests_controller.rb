class Potepan::SuggestsController < ApplicationController
  require "./lib/client/api_request"
  def show
    response = Client::ApiRequest.suggest(params[:keyword], params[:max_num])
    status = response.status
    if status == 200
      logger.debug { "response: #{response.inspect}" }
      render json: response.body
    else
      render json: {
        error: "エラーが発生しています。管理者に確認してください",
      }, status: 500
    end
  end
end

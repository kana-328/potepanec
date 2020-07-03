class Potepan::SuggestsController < ApplicationController
  def search
    url = ENV['API_SUGGEST_URL']
    query = { "keyword": params[:keyword], "max_num" => params[:max_num] }
    response = HTTPClient.get(url, query, headers)
    @response = response.body
    @status = response.status
    respond_to do |format|
      if @status == 200
        format.json { render json: @response }
        format.js
      else
        format.json do
          render json: {
            error: "必要なパラメーターが不足しています。管理者に確認してください。",
          }, status: 500
        end
      end
    end
  end
end
require 'httpclient'
require 'json'
class Potepan::SuggestsController < ApplicationController
  def search
    url = ENV['API_SUGGEST_URL']
    apikey = ENV['API_KEY']
    query = { "keyword" => params[:keyword], "max_num" => params[:max_num] }
    res = httpclient.get( url, query, Authorization: apikey)
    @res = res.body
      respond_to do |format|
        format.json { render json: @res }
      end
  end

  def httpclient
    client = HTTPClient.new()
  end
end

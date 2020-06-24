require 'httpclient'
class Potepan::SuggestsController < ApplicationController
  def search
    client = HTTPClient.new()
    url = ENV['API_SUGGEST_URL']
    query = {'keyword' => params[:keyword] }
    apikey = ENV['API_KEY']
    res = client.get(url, query, )
    @res = res.body
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url}
        format.json { render :json => @res }
        format.xml  { render :xml => @res }
      end
  end
end

module Client
  class ApiRequest
    def self.suggest(keyword, max_num)
      url = ENV['API_SUGGEST_URL']
      query = { keyword: keyword, max_num: max_num }
      headers = { Authorization: "Bearer #{ENV['API_KEY']}", "Content-Type": "application/json" }
      client = HTTPClient.new
      client.get(url, query, headers)
    end
  end
end

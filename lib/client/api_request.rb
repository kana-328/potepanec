module Client
  class ApiRequest
    def self.suggest(url, query, headers)
      client = HTTPClient.new
      client.get(url, query, headers)
    end
  end
end

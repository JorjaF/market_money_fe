require 'httparty'

module MarketApiHelper
  include HTTParty
  base_uri 'http://localhost:3000'

  def self.fetch_markets
    response = get('/api/v0/markets')

    if response.success?
      parse_markets_response(response)
    else
      nil 
    end
  end

  def self.fetch_market(id)
    response = get("/api/v0/markets/#{id}")
    
    if response.success?
      parse_markets_response(response)
    else
      nil
    end
  end

  def self.fetch_vendors(id)
    response = get("/api/v0/markets/#{id}/vendors")

    if response.success?
      parse_markets_response(response)
    else
      nil
    end
  end

  private

  def self.parse_markets_response(response)
    data = JSON.parse(response.body)
    markets_data = data['data']
    markets_data
  end
end

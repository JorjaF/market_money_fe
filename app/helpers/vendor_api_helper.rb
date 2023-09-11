require "httparty"

module VendorApiHelper
  include HTTParty
  base_uri 'http://localhost:3000'
  
  def self.fetch_vendor(id)
    response = get("/api/v0/vendors/#{id}")
    
    if response.success?
      parse_vendors_response(response)
    else
      nil
    end
  end
  
  def self.parse_vendors_response(response)
    data = JSON.parse(response.body)
    vendors_data = data['data']
    vendors_data
  end
end

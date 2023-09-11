require 'rails_helper'

RSpec.describe MarketApiHelper do
  describe '.fetch_markets' do
    it 'fetches and parses all markets data from the API' do
      api_response = {
        data: [
          {
            id: '322458',
            type: 'market',
            attributes: {
              name: "14&U Farmers' Market",
              street: '1400 U Street NW',
              city: 'Washington',
              county: 'District of Columbia',
              state: 'District of Columbia',
              zip: '20009',
              lat: '38.9169984',
              lon: '-77.0320505',
              vendor_count: 0
            }
          }
        ]
      }

      markets_data = MarketApiHelper.fetch_markets
      expect(markets_data).to be_an(Array)
      expect(markets_data.first["id"]).to eq(api_response[:data].first[:id])
    end
  end

  it 'fetches and parses a single market from the API' do
    api_response = {
      data: {
        id: '322458',
        type: 'market',
        attributes: {
          name: "14&U Farmers' Market",
          street: '1400 U Street NW',
          city: 'Washington',
          county: 'District of Columbia',
          state: 'District of Columbia',
          zip: '20009',
          lat: '38.9169984',
          lon: '-77.0320505',
          vendor_count: 0
        }
      }
    }

    market_data = MarketApiHelper.fetch_market('322458')
    expect(market_data).to be_a(Hash)
    expect(market_data["id"]).to eq(api_response[:data][:id])
  end

  it 'fetches and parses all vendors for a single market from the API' do
    api_response = {
      data: [
        {
          id: '54849',
          type: 'vendor',
          attributes: {
            name: 'Beekeeper',
            num_employees: 2,
            market_id: '322458'
          }
        }
      ]
    }

    vendors_data = MarketApiHelper.fetch_vendors('322458')
    expect(vendors_data).to be_an(Array)
    expect(vendors_data.first["id"]).to eq(api_response[:data].first[:id])
  end
end

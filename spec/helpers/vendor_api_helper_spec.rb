require "rails_helper"

RSpec.describe VendorApiHelper do
  describe '.fetch_vendor' do
    it 'fetches and parses a single vendor from the API' do
      api_response = {
        data: {
          id: '54849',
          type: 'vendor',
          attributes: {
            name: "Organic Farms",
            description: "This vendor specializes in selling fresh, organic fruits and vegetables grown on their farm. They may also sell jams, jellies, and pickles made from their produce.",
            contact_name: "Msgr. Floyd Cole",
            contact_phone: '390.398.6702',
            credit_accepted: false,
          }
        }
      }
    vendor_data = VendorApiHelper.fetch_vendor('54849')

    expect(vendor_data).to be_a(Hash)
    expect(vendor_data["id"]).to eq(api_response[:data][:id])
    expect(vendor_data["type"]).to eq(api_response[:data][:type])
    expect(vendor_data["attributes"]["name"]).to eq(api_response[:data][:attributes][:name])
    expect(vendor_data["attributes"]["description"]).to eq(api_response[:data][:attributes][:description])
    expect(vendor_data["attributes"]["contact_name"]).to eq(api_response[:data][:attributes][:contact_name])
    expect(vendor_data["attributes"]["contact_phone"]).to eq(api_response[:data][:attributes][:contact_phone])
    expect(vendor_data["attributes"]["credit_accepted"]).to eq(api_response[:data][:attributes][:credit_accepted])
    end
  end
end

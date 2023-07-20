require "rails_helper"

RSpec.describe EngineService do
  describe "#all_merchants" do
    it "establishes a connection to retreive all merchants" do
      merchants = EngineService.new.all_merchants

      expect(merchants).to be_a(Hash)
      expect(merchants).to have_key(:data)
      expect(merchants[:data]).to be_an(Array)

      merchant = merchants[:data][0]
      expect(merchant).to be_a(Hash)
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_a(String)
      expect(merchant[:id]).to eq("1")

      expect(merchant[:type]).to eq("merchant")

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
      expect(merchant[:attributes][:name]).to eq("Schroeder-Jerde")
    end
  end

  describe "#merchant_details(id)" do
    it "establishes a connection to fetch one merchant" do
      merchant = EngineService.new.merchant_details(2)

      expect(merchant).to be_a(Hash)
      expect(merchant).to have_key(:data)
      expect(merchant[:data]).to have_key(:id)
      expect(merchant[:data][:id]).to be_a(String)
      expect(merchant[:data][:id]).to eq("2")

      expect(merchant[:data]).to have_key(:type)
      expect(merchant[:data][:type]).to be_a(String)
      expect(merchant[:data][:type]).to eq("merchant")

      expect(merchant[:data]).to have_key(:attributes)
      expect(merchant[:data][:attributes]).to have_key(:name)
      expect(merchant[:data][:attributes][:name]).to be_a(String)
      expect(merchant[:data][:attributes][:name]).to eq("Klein, Rempel and Jones")
    end
  end

  describe "#items_by_merchant(id)" do
    it "establishes a connection to fetch a merchants items" do
      merchant = EngineService.new.items_by_merchant(3)
      
      expect(merchant).to have_key(:data)
      items = merchant[:data]
      expect(items.count).to eq(25)

      item = merchant[:data].first
      expect(item).to have_key(:id)
      expect(item[:id]).to be_a(String)

      expect(item).to have_key(:type)
      expect(item[:type]).to eq("item")

      expect(item).to have_key(:attributes)
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a(Float)

      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_an(Integer)
      expect(item[:attributes][:merchant_id]).to eq(3)
    end
  end
end
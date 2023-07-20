require "rails_helper"

RSpec.describe EngineFacade do
  describe "#merchants" do
    it "can find all merchants and make merchant objects" do
      merchants = EngineFacade.new.merchants

      expect(merchants.count).to eq(100)
      expect(merchants).to be_an(Array)

      merchants.each do |merchant|
        expect(merchant).to be_a(Merchant)
        expect(merchant.id).to be_a(String)
        expect(merchant.name).to be_a(String)
      end
    end
  end

  describe "#merchant_by_id(id)" do
    it "can find one merchant's details" do
      merchant = EngineFacade.new.merchant_by_id(3)

      expect(merchant).to be_a(Merchant)
      expect(merchant.id).to be_a(String)
      expect(merchant.id).to eq("3")
      expect(merchant.name).to be_a(String)
      expect(merchant.name).to eq("Willms and Sons")
    end
  end

  describe "#merchants_items(id)" do
    it "can find a merchant's items" do
      items = EngineFacade.new.merchants_items(3)
    
      expect(items).to be_an(Array)

      items.each do |item|
        expect(item).to be_an(Item)
        expect(item.id).to be_a(String)
        expect(item.name).to be_a(String)
      end

    end
  end
end
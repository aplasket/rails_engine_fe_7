require "rails_helper"

RSpec.describe "merchant_path(:id)" do
  describe "on /merchants, when a user clicks on the merchants link" do
    it "routes them to the merchants show page" do
      merchant = EngineFacade.new.merchants.first
      merchant_id = merchant.id.to_i

      visit merchants_path

      within(first(".merchant")) do
        click_on "#{merchant.name}"
      end

      expect(current_path).to eq(merchant_path(merchant_id))
    end
  end

  describe "as a visitor on a merchant's show page" do
    it "displays the merchant's name" do
      merchant = EngineFacade.new.merchant_by_id(1)

      visit merchant_path(1)

      expect(page).to have_content("Schroeder-Jerde")
    end

    it "displays a list of items that merchant sells" do
      merchant = EngineFacade.new.merchant_by_id(1)
      item = EngineFacade.new.merchants_items(1).first

      visit merchant_path(1)

      within(first(".item")) do
        expect(page).to have_content(item.name)
      end
    end
  end
end
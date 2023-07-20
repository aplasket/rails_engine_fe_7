require "rails_helper"

RSpec.describe "/merchants", type: :feature do
  describe "as a visitor on merchants index page" do
    it "see a list of merchants names" do
      merchant = EngineFacade.new.merchants.first

      visit merchants_path

      expect(page).to have_content("Merchants")
      expect(page).to have_css(".merchant", count: 100)

      within(first(".merchant")) do
        expect(page).to have_content(merchant.name)
      end
    end

    it "each merchant name is a link to their show page" do
      merchant = EngineFacade.new.merchants.first

      visit merchants_path

      within(first(".merchant")) do
        expect(page).to have_link(merchant.name)
      end
    end
  end
end
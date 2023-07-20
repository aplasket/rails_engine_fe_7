class EngineFacade
  def merchants
    json = service.all_merchants
    merchants = json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def merchant_by_id(id)
    json = service.merchant_details(id)
    Merchant.new(json[:data])
  end

  def merchants_items(id)
    json = service.items_by_merchant(id)
    items = json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def service
    EngineService.new
  end
end
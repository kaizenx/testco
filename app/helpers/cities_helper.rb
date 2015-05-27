module CitiesHelper
  def lowest_price(location)
    lowest_price = 0.0
    currency = "MYR"
    if location.pricings && location.pricings.size > 0
      lowest_price = location.pricings.all.order(:price).first
      "#{lowest_price.currency} #{lowest_price.price.floor}"
    end
    
  end
end

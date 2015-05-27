class AddCurrencyAndPeriodToPricing < ActiveRecord::Migration
  def change
    add_column :pricings, :currency, :string
    add_column :pricings, :period, :string
    add_column :pricings, :public, :boolean
    add_column :pricings, :location_id, :integer
  end
end

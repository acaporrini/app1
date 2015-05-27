class AddColorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :color, :string
    add_column :products, :price, :decimal
  end
end

class ChangeColumnInItems2 < ActiveRecord::Migration[6.0]
  def change
  	change_column(:items, :price, :decimal)
  end
end

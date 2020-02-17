class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def down
		LineItem.where("quantity>1").each do |line_item|
			line_item.quantity.times do
				LineItem.create cart_id: line_item.cart_id, item_id: line_item.item_id, quantity: 1
			end
			line_item.destroy
		end
	end
end

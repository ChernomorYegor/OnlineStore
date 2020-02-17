class Item < ApplicationRecord
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	validates :name, uniqueness: true
	validates :name, :description, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}

	private
	
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Существуют товарные позиции')
		  return false
		 end
	end
end

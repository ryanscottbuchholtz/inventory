class Inventory < ActiveRecord::Base
  validates_presence_of :title, :description, :quantity
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end

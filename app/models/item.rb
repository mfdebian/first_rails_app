class Item < ApplicationRecord
  has_many :traders

  validates :name, presence: true, length: { minimum: 1 }
  validates :price, presence: true
end

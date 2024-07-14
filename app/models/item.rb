class Item < ApplicationRecord
  has_many :traders

  def as_json(_options = {})
    json = {
      name: self.name,
      price: self.price
    }

    json[:traders] = self.traders unless self.traders.empty?

    return json
  end

  validates :name, presence: true, length: { minimum: 1 }, uniqueness: true
  validates :price, presence: true
end

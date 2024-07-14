class Trader < ApplicationRecord
  belongs_to :item

  def as_json(_options = {})
    {
      name: self.name,
      location: self.location,
      role: self.role
    }
  end
end

class Advertisement::AdvertisementForm < Reform::Form
  property :title
  property :description
  property :price
  property :address, populate_if_empty: Address do
    property :formatted_address
    property :lat
    property :lon

    validates :formatted_address, presence: true
  end

  validates :address, presence: true
  validates :title, presence: true, length: {maximum: 120}
  validates :description, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 0}
end

class Advertisement::Create < Trailblazer::Operation
  extend Contract::DSL

  contract do
    property :title
    property :description
    property :price

    validates :title, presence: true, length: { maximum: 120 }
    validates :description, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  end

  step Model(Advertisement)
  step Contract::Build()
  step Contract::Validate()
  step Contract::Persist()
end

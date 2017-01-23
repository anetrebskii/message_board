class Advertisement::Create < Trailblazer::Operation
  extend Contract::DSL

  contract do
    property :title
    property :description
    property :price

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
  end

  step Model(Advertisement)
  step Contract::Build()
  step Contract::Validate()
  step Contract::Persist()
end

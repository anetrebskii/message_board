class Advertisement::Create < Trailblazer::Operation
  extend Contract::DSL

  step Model(Advertisement)
  step Contract::Build(constant: AdvertisementForm)
  step Contract::Validate()
  step Contract::Persist(method: :sync)
  step :save!

  def save!(options)
    advertisement = options['model']
    Advertisement.create(advertisement.attributes)
    advertisement.address.advertisement_id = advertisement.id
    Address.create(advertisement.address.attributes)
  end

end

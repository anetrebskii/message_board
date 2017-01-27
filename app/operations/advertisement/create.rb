class Advertisement::Create < Trailblazer::Operation
  extend Contract::DSL
  include Model

  step Model(Advertisement)
  step Contract::Build(constant: AdvertisementForm)
  step Contract::Validate()
  failure Contract::Persist(method: :sync)
  step Contract::Persist(method: :sync)
  step :save!

  def save!(options)
    advertisement = options['model']
    new_advertisement = Advertisement.create(advertisement.attributes)
    new_advertisement.create_address(advertisement.address.attributes)
    options['model'] = new_advertisement
  end

end

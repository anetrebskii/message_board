describe 'My behaviour' do

  it 'should do something' do
    # a = Advertisements::Test.new
    result = ::Advertisement::Create.({title: 'title1', description: 'description1', price: 1, address: {formatted_address: ''}})
  end
end
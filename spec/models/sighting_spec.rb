require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'Sightings must include latitude input' do
    latitude_sighting = Sighting.create date: DateTime.now,latitude: nil, longitude: -0.124204369e3, animal_id: 1
    expect(latitude_sighting.errors[:latitude]).to_not be_empty
  end
  it 'Sightings must include longitude input' do
    longitude_sighting = Sighting.create date: DateTime.now,latitude: 0.41754768e2, longitude: nil, animal_id: 1
    expect(longitude_sighting.errors[:longitude]).to_not be_empty
  end
  it 'Sightings must include date input' do
    date_sighting = Sighting.create date: nil ,latitude: 0.41754768e2, longitude: -0.124204369e3, animal_id: 1
    expect(date_sighting.errors[:date]).to_not be_empty
  end
end

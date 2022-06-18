require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'Animal should require a common name input' do
    common_name_input = Animal.create common_name: nil, latin_name: "Big Baddie Wolf", kingdom:"Animalia"
    expect(common_name_input.errors[:common_name]).to_not be_empty
  end

  it 'Animal should require a latin name input' do
    common_name_input = Animal.create common_name: "Grey Wolf", latin_name: nil, kingdom:"Animalia"
    expect(common_name_input.errors[:latin_name]).to_not be_empty
  end

end

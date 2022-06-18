require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'Animal should require a common name input' do
    common_name_input = Animal.create common_name: nil, latin_name: "Big Baddie Wolf", kingdom:"Animalia"
    expect(common_name_input.errors[:common_name]).to_not be_empty
  end

  it 'Animal should require a latin name input' do
    latin_name_input = Animal.create common_name: "Grey Wolf", latin_name: nil, kingdom:"Animalia"
    expect(latin_name_input.errors[:latin_name]).to_not be_empty
  end

  it 'Animal should require common name and latin name to not equal each other' do
    equal_names_input = Animal.create common_name: "Wolf Grey", latin_name: "Canis Lupus", kingdom:"Animalia"
    expect(equal_names_input.common_name.downcase).not_to equal(equal_names_input.latin_name.downcase)
  end

  it 'Animal should require a common name to be unique' do
    Animal.create common_name: "Grey Wolf", latin_name: "Canis Lupus", kingdom:"Animalia"
    unique_common_name_input = Animal.create common_name: "Grey Wolf", latin_name: "Lupus Canis", kingdom:"Animalia"
    expect(unique_common_name_input.errors[:common_name]).to_not be_empty
  end

  it 'Animal should require a latin name to be unique' do
    Animal.create common_name: "Grey Wolf", latin_name: "Canis Lupus", kingdom:"Animalia"
    unique_latin_name_input = Animal.create common_name: "Wolf Grey", latin_name: "Canis Lupus", kingdom:"Animalia"
    expect(unique_latin_name_input.errors[:latin_name]).to_not be_empty
  end
end

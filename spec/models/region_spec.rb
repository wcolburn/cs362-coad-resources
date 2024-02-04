require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { build(:region, :name => 'Mt. Hood') }

  it "has a name" do
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    result = region.to_s
  end

  it "has many tickets" do
    should have_many(:tickets).class_name("Ticket")
  end

  it "validates length of name is at least 1 and at most 255" do
    should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
  end

  it "validates uniqueness of name" do
    should validate_uniqueness_of(:name).case_insensitive
  end

  it "returns string of name" do
    region.name = "Bend"
    expect(region.to_s).to eq("Bend")
  end

  it "Region.unspecified creates a Region with a name of Unspecified if none exists" do
    Region.where(name: "Unspecified").destroy_all
    expect(Region.unspecified.name).to eq("Unspecified")
  end

  it "Region.unspecified returns an existing Region with a name of Unspecified if it exists" do
    r = Region.create!(name:"Unspecified")
    expect(Region.unspecified).to eq(r)
  end

end

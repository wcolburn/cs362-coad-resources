require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resource) { build(:resource_category)}

    it "exists" do
        ResourceCategory.new
    end

    it "Has a name" do
        expect(resource).to respond_to(:name)
    end

    it "has an active" do
        expect(resource).to respond_to(:active)
    end

    it "Has many Tickets" do
        should have_many(:tickets).class_name("Ticket")
    end

    it "Has and belongs to Organization" do
        should have_and_belong_to_many(:organizations).class_name("Organization")
    end

    it "Validate presence of name" do
        should validate_presence_of(:name)
    end

    it "Validates length of name is at least 1 and at most 255" do
        should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    
    it "Validates uniqueness of name" do
        should validate_uniqueness_of(:name).case_insensitive
    end

    it "activate sets active to true" do
        resource.active=false
        resource.activate
        expect(resource.active).to eq(true)
    end

    it "deactivate sets active to false" do
        resource.active=true
        resource.deactivate
        expect(resource.active).to eq(false)
    end

    it "inactive? returns state of active" do
        resource.active=false
        expect(resource.inactive?).to eq(true)
        resource.active=true
        expect(resource.inactive?).to eq(false)
    end

    it "to_s returns name" do
        resource.name = "money"
        expect(resource.to_s).to eq("money")
    end

    it "ResourceCategory.unspecified creates a ResourceCategory with a name of Unspecified if none exists" do
        ResourceCategory.where(name: "Unspecified").destroy_all
        expect(ResourceCategory.unspecified.name).to eq("Unspecified")
    end
    
    it "ResourceCategory.unspecified returns an existing ResourceCategory with a name of Unspecified if it exists" do
        resource = ResourceCategory.create!(name:"Unspecified")
        expect(ResourceCategory.unspecified).to eq(resource)
    end

    it "active scope method returns all active ResourceCategory" do
        activeResource1=create(:resource_category)
        activeResource1.activate
        activeResource2=create(:resource_category)
        activeResource2.activate
        resource.deactivate
        expect(ResourceCategory.active).to eq([activeResource1, activeResource2])
    end

    it "inactive scope method returns all inactive ResourceCategory" do
        inactiveResource1=create(:resource_category)
        inactiveResource1.deactivate
        inactiveResource2=create(:resource_category)
        inactiveResource2.deactivate
        activeResource=create(:resource_category)
       resource.activate
        expect(ResourceCategory.inactive).to eq([inactiveResource1, inactiveResource2])
    end
end
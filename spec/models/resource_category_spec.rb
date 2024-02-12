require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    it "exists" do
        ResourceCategory.new
    end

    it "Has a name" do
        resource = ResourceCategory.new
        expect(resource).to respond_to(:name)
    end

    it "has an active" do
        resource = ResourceCategory.new
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
        resource=ResourceCategory.new
        resource.active=false
        resource.activate
        expect(resource.active).to eq(true)
    end

    it "deactivate sets active to false" do
        resource=ResourceCategory.new
        resource.active=true
        resource.deactivate
        expect(resource.active).to eq(false)
    end

    it "inactive? returns state of active" do
        resource=ResourceCategory.new
        resource.active=false
        expect(resource.inactive?).to eq(true)
        resource.active=true
        expect(resource.inactive?).to eq(false)
    end

    it "to_s returns name" do
        resource = ResourceCategory.new
        resource.name = "money"
        expect(resource.to_s).to eq("money")
    end
end

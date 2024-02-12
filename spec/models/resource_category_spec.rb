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
end

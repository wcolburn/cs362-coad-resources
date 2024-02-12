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
end

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
end

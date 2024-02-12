require 'rails_helper'

RSpec.describe User, type: :model do

    it "exists" do
        User.new
    end

    it "Has an email" do
        user = User.new
        expect(user).to respond_to(:email)
    end

    it "Has a role" do
        user = User.new
        expect(user).to respond_to(:role)
    end

    it "Belongs to Organization" do
        should belong_to(:organization).class_name("Organization").optional
    end
end

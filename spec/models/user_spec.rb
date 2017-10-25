require 'rails_helper'

RSpec.describe User, :type => :model do
  new_user = User.create!(name: "LeVeon Bell", username: "RBPitSteelers", password: "123456", email: "Leveon@yahoo.com")

  expect(User.name). to eq("LeVeon Bell")
end

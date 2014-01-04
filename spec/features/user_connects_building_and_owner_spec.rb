  require 'spec_helper'

  feature "User connects building with owner"

  # As a real estate associate
  # I want to correlate an owner with buildings
  # So that I can refer back to pertinent information
  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

it "creates a valid building with owner" do
    visit '/owners/new'
    ill_in "First name", with: "Krystle"
    fill_in "Last name", with: "Bates"
    fill_in "Email", with: "krebates@gmail.com"
    click_on "Create Owner"

    visit '/buildings/new'
    #Fill in each input field
    fill_in "Street address", with: "123 Great St."
    fill_in "City", with: "Great Town"
    select "HI", from: "State"
    fill_in "Zip code", with: "12345"
    select
    click_on "Add Building"
  end
end

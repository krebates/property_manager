require 'spec_helper'

feature "admin adds building information" do

# As a real estate associate
# I want to record a building
# So that I can refer back to pertinent information
# Acceptance Criteria:

# I must specify a street address, city, state, and postal code
# Only US states can be specified
# I can optionally specify a description of the building
# If I enter all of the required information in the required format, the building is recorded.
# If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# Upon successfully creating a building, I am redirected so that I can record another building.

  it "creates a valid building info without description" do
    #visit the page contain new building form
    visit '/buildings/new'

    #Fill in each input field
    fill_in "Street address", with: "123 Great St."
    fill_in "City", with: "Great Town"
    select "HI", from: "State"
    fill_in "Zip code", with: "12345"
    fill_in "Description", with: "words that describe"
    click_on "Add Building"

    #visits page with all buildings
    visit '/buildings'
    expect(page).to have_content "words that describe"
  end

  it "creates a valid building info without description" do
    #visit the page contain new building form
    visit '/buildings/new'

    #Fill in each input field
    fill_in "Street address", with: "123 Great St."
    fill_in "City", with: "Great Town"
    select "HI", from: "State"
    fill_in "Zip code", with: "12345"
    click_on "Add Building"
    visit '/buildings'
    expect(page).to have_content "123 Great St."
  end

  it 'requires a city' do
    visit '/buildings/new'
    click_on "Add Building"
    expect(page).to have_content("can't be blank")
  end
end


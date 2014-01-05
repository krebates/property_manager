  require 'spec_helper'

  feature "User connects building with owner" do

  # As a real estate associate
  # I want to correlate an owner with buildings
  # So that I can refer back to pertinent information
  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

it "creates a valid building with owner" do
    visit '/owners/new'
    fill_in "First name", with: "Krystle"
    fill_in "Last name", with: "Bates"
    fill_in "Email", with: "krebates@gmail.com"
    click_on "Create Owner"

    visit '/buildings/new'
    fill_in "Street address", with: "123 Great St."
    fill_in "City", with: "Great Town"
    select "HI", from: "State"
    fill_in "Zip code", with: "12345"
    select "Bates", from: "Owner"
    click_on "Add Building"

    visit '/buildings'
    expect(page).to have_content "123 Great St."
    expect(page).to have_content "Bates"
  end


  it "deletes an owner, primary key no longer associated with any properties" do
    owner = FactoryGirl.create(:owner)

    visit '/buildings/new'
    fill_in "Street address", with: "123 Great St."
    fill_in "City", with: "Great Town"
    select "HI", from: "State"
    fill_in "Zip code", with: "12345"
    select "Bates", from: "Owner"
    click_on "Add Building"

    visit '/buildings/new'
    fill_in "Street address", with: "555 Good St."
    fill_in "City", with: "Great Town"
    select "IL", from: "State"
    fill_in "Zip code", with: "12395"
    select "Bates", from: "Owner"
    click_on "Add Building"

    visit '/owners'
    click_on 'Delete information'
    expect(page).not_to have_content owner.last_name

    visit '/buildings'
    expect(page).not_to have_content "Bates"
    expect(page).not_to have_content owner.last_name
  end
end



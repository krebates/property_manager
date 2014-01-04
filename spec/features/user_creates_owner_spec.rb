require 'spec_helper'

feature "User creates building owner" do
  # As a real estate associate
  # I want to record a building owner
  # So that I can keep track of our relationships with owners
  # Acceptance Criteria:

  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  it "creates a valid owner" do
    #visit the page containing form
    visit '/owners/new'
    fill_in "First name", with: "Krystle"
    fill_in "Last name", with: "Bates"
    fill_in "Email", with: "krebates@gmail.com"
    click_on "Create Owner"
  end

  it 'requires a last name' do
    visit '/owners/new'
    click_on "Create Owner"
    expect(page).to have_content("can't be blank")
  end

end

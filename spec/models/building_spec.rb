require 'spec_helper'

describe Building do
  let(:blanks){['', nil, ' ']}

  it { should have_valid(:street_address).when("123 Great St.") }
  it { should_not have_valid(:street_address).when(*blanks) }

  it { should have_valid(:city).when("Great Town") }
  it { should_not have_valid(:city).when(*blanks) }

  it { should have_valid(:zip_code).when("12345") }
  it { should_not have_valid(:zip_code).when("1234") }
  it { should_not have_valid(:zip_code).when(*blanks) }

end

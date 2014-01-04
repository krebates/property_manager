require 'spec_helper'

describe Owner do

  it { should have_many :buildings}


  let(:blanks){['', nil, ' ']}

  it { should have_valid(:first_name).when("Krystle") }
  it { should_not have_valid(:first_name).when(*blanks) }


  it { should have_valid(:last_name).when("Bates") }
  it { should_not have_valid(:last_name).when(*blanks) }

  it { should have_valid(:email).when("krebates@gmail.com") }
  it { should_not have_valid(:email).when("lajf@g") }
  it { should_not have_valid(:email).when(*blanks) }


end

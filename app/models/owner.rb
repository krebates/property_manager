class Owner < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of(:last_name)
  validates_presence_of(:email)
  validates_format_of :email, :with => /\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z/i
  has_many :buildings
end

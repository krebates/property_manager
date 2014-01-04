class Building < ActiveRecord::Base

  validates_presence_of(:street_address)
  validates_presence_of(:city)
  validates_presence_of(:zip_code)
  validates_length_of :zip_code, is: 5

end

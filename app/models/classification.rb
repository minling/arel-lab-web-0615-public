class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all.uniq
  end

  def self.longest
    longest_boat = Boat.order(length: :desc).limit(1)
     self.joins(:boats).where("boat_classifications.boat_id = (?)", longest_boat.pluck(:id)) 
  end
end

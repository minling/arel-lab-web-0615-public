class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
     self.joins(boats: :classifications).where(classifications: {name: 'Catamaran'})
  end

  def self.sailors
    self.joins(boats: :classifications).where(classifications: {name: 'Sailboat'}).uniq
  end

  def self.talented_seamen
    sailboat = self.joins(boats: :classifications).where(classifications: {name: 'Sailboat'}).uniq
    motorboat = self.joins(boats: :classifications).where(classifications: {name: 'Motorboat'}).uniq
    self.where(" id IN (?)", sailboat.pluck(:id) & motorboat.pluck(:id))
    # sailboat.union(motorboat)
  end

  def self.non_sailors  
    #sailboat_classification = BoatClassification.where('classification_id = 2')
    #non_sailboats_classification = BoatClassification.where('classification_id != 2')
    # sailboat_classification = Classification.find_by(name: 'Sailboat')
    # sailboat = BoatClassification.find_by(classification_id: boat_classification).boat.captain
    # self.joins(boats: :classifications).where('boat_classifications.classification_id != ?', sailboat_classification).uniq
    self.where("id NOT IN (?)", self.sailors.pluck(:id))
  end

  #Find boats that are sailboats
  #Find boats that are sailboats << some boats are considered more than one thing

end

class BoatClassification < ActiveRecord::Base
  belongs_to :boat
  belongs_to :classification
end

# Find all the captains of boats that are not sailboats

# Find all the captains of boats that are sailboats
# Then exclude these

# Find all the sailboats
# Find all the boats that are not sailboats!!!
# Find the associated captains

# sailboat_classification = Classification.find_by(name: 'Sailboat').first
# sailboats = BoatClassification.where(classification_id: 2)
# # BoatClassification.where(classification: sailboat_classification)
# sailboat_classifications = BoatClassification.where(classification_id: 2)
sailboat_classification = Classification.where(name: 'Sailboat').first
non_sailboat_classifications = BoatClassification.where.not(classification_id: 2)
sailboat_classification = Classification.where(name: 'sailboat')
Captain.joins(boats: :classifications).where('boat_classifications.classification_id != ?', sailboat_classification)
# Captain.include(:boats).include(:boat_classifications)
# captains = BoatClassification.where.not(classification_id: 2).map do |boat_classification|
#   boat_classification.boat.captain
# end



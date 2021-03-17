class Personnage < ApplicationRecord
	#un personnage apparteint à un seul user 
	belongs_to :user
end

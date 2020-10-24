class Player < ActiveRecord::Base
has_many :matches
has_secure_password

validates_presence_of :name
validates :name, uniqueness: true

 #@@wins = []

#def wins
#  match = Match.find_by(:winner)
#end

end

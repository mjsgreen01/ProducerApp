class Artist < ActiveRecord::Base

	has_many :song_involvements
	has_many :songs, through: :song_involvements
	

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    where(nil)
	  end
	end


end

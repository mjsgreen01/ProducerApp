class Artist < ActiveRecord::Base

	has_many :song_involvements
	has_many :songs, through: :song_involvements
	

	def self.search(search)
	  if search
	    where('name ILIKE ?', "%#{search}%")
	  else
	    where(nil)
	  end
	end

	scope :artist_producers, -> {joins(:song_involvements).where( :song_involvements => { :producer => true } ).distinct}


end

module MyRandom
	def self.get_random(players_no, winners_no)
		(0...players_no).sort_by{ SecureRandom.random_number }[0...winners_no]
	end
end
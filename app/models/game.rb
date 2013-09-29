class Game < ActiveRecord::Base
	has_many :associations
	has_many :users, through: :associations

	def make_it_happen
		if self.players_no == self.users.count
			random = Random.new
			lucky = random.rand(players_no)

			self.users.sort { random.rand() }[1..winners_no]
		end
	end
end

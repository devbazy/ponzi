class Game < ActiveRecord::Base
	has_many :associations
	has_many :users, through: :associations
	after_save :randomize

	# TEMP!
	attr_accessor :players, :random, :zarobione

	def make_it_happen
		fee = 0.001

=begin
UPDATE accounts
SET amount = amount - 10
WHERE id IN (24, 25, 26) # all players ids

UPDATE accounts
SET amount = amount + jackpot
WHERE id IN (24, 25, 26) # winners ids
=end

		if self.players_no == self.users.count
			winners = self.users.shuffle[1..self.winners_no]			
			jackpot = (self.cost * (1-fee) * self.players_no) / self.winners_no

			Account.connection.execute("
				UPDATE accounts
				SET amount = amount - #{self.cost}
				WHERE id IN (#{self.users.map(&:account).map(&:id).join(', ')})")

			Account.connection.execute("
				UPDATE accounts
				SET amount = amount + #{jackpot}
				WHERE id IN (#{winners.map(&:account).map(&:id).join(', ')})")
		end
	end

	private
		def randomize
			@random = Random.new(self.seed)
		end
end

class Game < ActiveRecord::Base
	has_many :associations
	has_many :users, through: :associations
	after_save :randomize

	# TEMP!
	attr_accessor :players, :random

	def make_it_happen
		fee = 0.015

		if self.players_no == self.users.count
			winners = self.users.shuffle[1..self.winners_no]
			
			jackpot = (self.cost * (1-fee) * self.players_no) / self.winners_no

			self.users.each do |user|
				user.account.amount -= self.cost
				if winners.include?(user)
					user.account.amount += jackpot
				end
				user.account.save
			end
		end
	end

	private
		def randomize
			@random = Random.new(self.seed)
		end
end

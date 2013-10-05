class Game < ActiveRecord::Base
	has_many :associations
	has_many :users, through: :associations
	after_save :randomize

	default_scope -> { order('created_at DESC') }

	validates :players_no, presence: true,
		numericality: { greater_than_or_equal_to: 2 }
	validates :winners_no, presence: true,
		numericality: { greater_than: 0, less_than: :players_no }
	validates :cost, presence: true,
		numericality: { greater_than: 0.0 }
	validates :open, presence: true
	validate :players_account_amount

	# TEMP!
	attr_accessor :players, :random, :zarobione

	def make_it_happen
		fee = 0.001

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

		def players_account_amount
			self.users.each do |user|
				if user.account.amount < self.cost
					errors.add(:users, "Too low amount on user #{user.login} account")
				end
			end
		end
end

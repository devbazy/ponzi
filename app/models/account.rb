class Account < ActiveRecord::Base
	belongs_to :user

	validates :amount, presence: true,
				numericality: { greater_than_or_equal_to: 0.0 }

	BITCOIN_ADDRESS_REGEX = /^(1|3)[1-9A-HJ-NP-Za-km-z]{27,34}/
	validates :daddr, presence: true,
					  format: { with: BITCOIN_ADDRESS_REGEX }
	validates :waddr, presence: true,
					  format: { with: BITCOIN_ADDRESS_REGEX }
end

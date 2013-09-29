class User < ActiveRecord::Base
	has_one :account, dependent: :destroy
	
	has_many :associations
	has_many :games, through: :associations
end

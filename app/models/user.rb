class User < ActiveRecord::Base
	has_one :account, dependent: :destroy
	
	has_many :associations
	has_many :games, through: :associations

	before_save { email.downcase! }

	validates :login, presence: true, length: { minimum: 3, maximum: 30 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }
end

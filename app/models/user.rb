class User < ActiveRecord::Base

	# This gives us setter/getter methods 
	# This might not be in the database
	attr_accessor :password
	before_save :encrypt_password

	# This is validation
	# It checks that the password_confirmation == password
	# Automatically gives us the password_conformation setter
	# this validator gives us foo_confirmation
	validates :password, confirmation: true
	validates :password, presence: true, on: :create
	validates :email, presence: true
	validates :email, uniqueness: true

	# Allows mass assignment of these
  attr_accessible :email, :password, :password_confirmation

  def encrypt_password
  	if password.present?
  		# This generates a random string that helps me encrypt the password
  		self.password_salt = BCrypt::Engine.generate_salt

  		# This encrypts the password, using the salt we just created
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
end

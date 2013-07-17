class User < ActiveRecord::Base

	# This gives us setter/getter methods 
	# This might not be in the database
	attr_accessor :password

	# This is validation
	# It checks that the password_confirmation == password
	# Automatically gives us the password_conformation setter
	# this validator gives us foo_confirmation
	validates :password, confirmation: true
	validates :password, presence: true, on: :create
	validates :email, presence: true
	validates :email, uniqueness: true

	# Allows mass assignment of these
  attr_accessible :email, :password_hash, :password_salt
end

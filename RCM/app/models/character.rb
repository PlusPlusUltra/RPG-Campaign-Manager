class Character < ApplicationRecord
	validates :name, presence: true
	validates :info, presence: true
	
	belongs_to :user, optional: true
end
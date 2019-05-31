class Character < ApplicationRecord
	validates :name, presence: true
	validates :lvl, presence: true, inclusion: 1..20
	validates :class_type, presence: true
	validates :race, presence: true
	validates :info, presence: true
	
	belongs_to :user, optional: true
end
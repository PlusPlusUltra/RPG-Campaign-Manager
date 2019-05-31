class Campaign < ApplicationRecord
	belongs_to :user, optional: true
	has_many :characters, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true
	@@lastC = ""
	def self.setLast (lastCa)
		@@lastC = lastCa
	end
	def self.getLast
		@@lastC
	end
	@@lastId
	def self.setLastId (li)
		@@lastId = li
	end
	def self.getLastId
		@@lastId
	end
	@@destId
	def self.setDestId (di)
		@@destId = di
	end
	def self.getDestId
		@@destId
	end
	@@userer
	def self.setUserer (us)
		@@userer = us
	end
	def getUserer
		@@userer
	end
end

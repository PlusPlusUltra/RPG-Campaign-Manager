class Campaign < ApplicationRecord
	belongs_to :user, optional: true
	has_many :characters
end
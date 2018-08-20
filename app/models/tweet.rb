class Tweet < ApplicationRecord

	belongs_to :user

	validates :message, presence: true
	validates :message, length: {maximum: 250, too_long: "Too many characters."}
end

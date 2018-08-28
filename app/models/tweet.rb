class Tweet < ApplicationRecord

	belongs_to :user

	has_many :tweet_tags
	has_many :tags, through: :tweet_tags

	before_validation :link_check, on: :create
	validates :message, presence: true
	validates :message, length: {maximum: 250, too_long: "Too many characters."}, on: :create
	after_validation :apply_link, on: :create



# CHECKS IF THERE ARE ANY LINKS IN THE MESSAGE (HTTPS)
# SPLITS EACH WORD INTO INDIVIDUAL VALUES IN AN ARRAY
# MAKES LINK DISPLAY NO BIGGER THAN 23 CHARACTERS
# JOINS BACK TOGETHER WITH SHORTER LINK
	def link_check
		if self.message.include? "https://"
			arr = self.message.split

			indx = arr.map { |x| x.include? "https://" }.index(true)

			self.link = arr[indx]

				if arr[indx].length > 23
					arr[indx] = "#{arr[indx][0..20]}..."
				end 

			self.message = arr.join(" ")
		end
	end


# SPLITS MESSAGE AGAIN INTO AN ARRAY OF VALUES FOR EACH WORD
# IF THERE IS AN HTTPS LINK, IF INDX IS TRUE
# APPLIES URL INTO AN <A> TAG TO MAKE A CLICKABLE LINK
# JOINS BACK TOGETHER AGAIN
	def apply_link
			arr = self.message.split
			indx = arr.map { |x| x.include? "https://" }.index(true)
			if indx
				url = arr[indx]
				arr[indx] = "<a href='#{self.link}' target='_blank'>#{url}</a>"
			end

			self.message = arr.join(" ")
	end


end

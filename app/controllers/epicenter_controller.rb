class EpicenterController < ApplicationController

	# ITERATE THROUGH TWEETS OF PEOPLE YOU'RE FOLLOWING OR/AND YOUR OWN TWEETS
  def feed
  	@following_tweets = []

  	Tweet.all.each do |tweet|
  		if current_user.following.include?(tweet.user.id) || current_user.id == tweet.user.id
  			@following_tweets.push(tweet)
  		end
  	end
  end

  def show_user
  end

  def now_following
  end

  def unfollow
  end
end

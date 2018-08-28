class EpicenterController < ApplicationController

  def all_users
    @users = User.all
  end

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
    end    
  end


	# ITERATE THROUGH TWEETS OF PEOPLE YOU'RE FOLLOWING OR/AND YOUR OWN TWEETS
  def feed
  	@following_tweets = []

    if current_user
    	Tweet.all.each do |tweet|
    		if current_user.following.include?(tweet.user.id) || current_user.id == tweet.user.id
    			@following_tweets.push(tweet)
    		end
    	end
    end
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end

end

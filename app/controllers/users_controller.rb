class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user]) #this is equivalent to grabbing all user attributes, :user is a hash of hashes
    if @user.save
      sign_in @user
    	flash[:success] = "Welcome to The Fuelist!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
end

require 'gmail_xoauth'
class UsersController < ApplicationController
  # include OauthHelper


  def logout
  end

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def home
   logged = session[:user_id] || false
   if logged
     @experiences = Experience.all
   else   #Should we refactor this to a filter? b/c were going to be checking this every request
     redirect_to login_path
   end

  end

end

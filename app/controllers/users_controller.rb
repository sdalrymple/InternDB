require 'gmail_xoauth'
class UsersController < ApplicationController
  # include OauthHelper
  before_filter :require_user
  include UsersHelper

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
   if User.find(session[:user_id]).is_admin?()
    redirect_to admin_path
   else
    sort = params[:sort] || session[:sort] || {}
    session[:sort] = sort
    ordering = choose_ordering(sort)
    exp = Experience.where("approved = ?", true)
    exp = exp.order(ordering[:order])
    @experiences = exp
   end
   # else   #Should we refactor this to a filter? b/c were going to be checking this every request
   #   redirect_to login_path
   # end

  end

  private

  def require_user
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end

end

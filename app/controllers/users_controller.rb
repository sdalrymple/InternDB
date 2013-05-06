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
      redirect_to admin_path and return
    else
     sort = params[:sort] || session[:sort] || {:order => :updated_at}
     session[:sort] = sort
     ordering = choose_ordering(sort) || {:order => :updated_at}
     exp = Experience.where("approved = ?", true)
     # exp = exp.order(ordering[:order])
     # @experiences = exp
    end 
    @search = {industry: '', organization: '', season: '', city: '', state: ''}  
    search = params[:experience] || nil   
    if search.nil? == false
      @search.keys.each do |f|
        if search[f] != ''
          @search[f.to_sym] = search[f]
          exp = exp.where('lower(' + f.to_s + ') = lower(?)', search[f])
        end
      end
    end
    exp = exp.order(ordering[:order])
    @experiences = exp
  end





   # else   #Should we refactor this to a filter? b/c were going to be checking this every request
   #   redirect_to login_path
   # end

  private

  def require_user
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
    @user_id = session[:user_id]
  end

end

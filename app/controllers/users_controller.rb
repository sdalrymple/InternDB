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
    sort = params[:sort] || session[:sort] || :updated_at
    session[:sort] = sort
    ordering = choose_ordering(sort) || {order: :updated_at}
    exp = Experience.where("approved = ?", true)
    exp = exp.order(ordering[:order])
    @experiences = exp
   end
   
    search = params[:experience]
   
    if search.nil? == false    
           keys = [:industry, :organization, :season, :city, :state]
           @experiences = Experience.all(:conditions => (SmartTuple.new(" AND ").add_each(keys) do |k| {k => search[k]} if search[k].present? end).compile)
    else
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

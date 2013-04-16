class ExperiencesController < ApplicationController
  before_filter :require_user

  def new
  end

  def create
      params[:experience][:user_id] = session[:user_id]
      params[:experience][:approved] = false
      @experience = Experience.create!(params[:experience])
      flash[:notice]= "Your experience at #{@experience.organization} was added successfully!"
      redirect_to root_path
  end

  def index
  end
  
  private

  def require_user
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end

end

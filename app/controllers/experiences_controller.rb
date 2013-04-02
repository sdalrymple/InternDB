class ExperiencesController < ApplicationController

  def new
  end

  def create
      @experience = Experience.create!(params[:experience])
      flash[:notice]= "Your experience at #{@experience.organization} was added successfully!"
      redirect_to root_path
  end

  def index
  end
  
  

end

class ExperiencesController < UsersController

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

end

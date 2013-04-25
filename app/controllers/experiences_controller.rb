class ExperiencesController < UsersController

  def new
  end

  def create
      params[:experience][:user_id] = session[:user_id]
      params[:experience][:approved] = false
      params[:experience][:approved] = false
      if params[:experience][:paid] == 'Yes'
        params[:experience][:paid] = true
      end
      if params[:experience][:repeat] = 'Yes'
        params[:experience][:repeat] = true
      end
      params[:experience][:composite] = (params[:experience][:hands_on_rating].to_i + params[:experience][:network_rating].to_i + params[:experience][:exposure_rating].to_i) / 3.0 
      @experience = Experience.create!(params[:experience])
      flash[:notice]= "Your experience at #{@experience.organization} was added successfully!"
      redirect_to root_path
  end

  def index
  end

  def show
    id = params[:id]
    @experience = Experience.find(id)
  end

end

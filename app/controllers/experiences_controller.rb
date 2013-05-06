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

  def company
   id = params[:id]
   @review = Experience.find(id)
   @company = @review.organization
   @experiences = Experience.where("organization = ? AND approved = ?", @company, true)
   total = @experiences.length
   hands=net=expose=0.0
   industries = Hash.new(0)
   @contact = Hash.new(0)
   roles = Hash.new(0)
   repeat = 0
   @relation = Hash.new(0)
   @experiences.each do |exp|
      repeat += 1 if exp.repeat
      hands += exp.hands_on_rating
      net += exp.network_rating
      expose += exp.exposure_rating
      industries[exp.industry] += 1
      roles[exp.function] += 1
      @contact[exp.contact] += 1
      @relation[exp.contact] = exp.contact_relation
    end
    @would = "#{repeat} of #{total} reviews said they would repeat" 
    @compo = ((hands + net + expose) / (3.0*total)).round(2)
    @hands = (hands/total).round(2)
    @net = (net/total).round(2)
    @expose = (expose/total).round(2)
    @ind = (industries.keys) * ", "
    @roles = (roles.keys.sort { |a,b| roles[b] <=> roles[a] })
    @roles = (@roles.take(5)) * ", "
    @contactlist = @contact.keys.sort{ |a,b| @contact[b] <=> @contact[a] }.take(5)
  end

  def show
    id = params[:id]
    @experience = Experience.find(id)
  end


end

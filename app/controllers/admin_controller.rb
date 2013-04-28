require 'gmail_xoauth'
class AdminController < UsersController
  
  before_filter :require_admin

  def home
    sort = params[:sort] || session[:sort] || {}
    session[:sort] = sort
    case sort
    when 'company'
      ordering = {:order => :organization}
    when 'industry'
      ordering = {:order => :industry}
    when 'role'
      ordering = {:order => :function}
    when 'location'
      ordering = {:order => 'state, city'}
    when 'internship_date' 
      ordering = {:order => 'year desc, season'}
    when 'review_date'
      ordering = {:order => 'updated_at desc'}
    when 'repeat'
      ordering = {:order => :repeat}
    when 'composite'
      ordering = {:order => 'composite desc'}
    when 'hands_on_rating'
      ordering = {:order => 'hands_on_rating desc'}
    when 'network_rating'
      ordering = {:order => 'network_rating desc'}
    when 'exposure_rating'
      ordering = {:order => 'exposure_rating desc'}
    end
    @experiences = Experience.find_all_by_approved(true, ordering)
  end
  

  def unapproved
    @unapproved = Experience.where("approved = ?", false)
  end

  def denied
    @denied = Experience.where("denied = ?", true)
  end


  def show
    id = params[:id]

    @experience = Experience.find(id)
    @user = User.find(@experience.user_id)
    @approveURI = "/admin/#{id}/approve"
    @denyURI = "/admin/#{id}/deny"
    if @experience.approved == false
      @previous = admin_unapproved_path
    elsif @experience.approved == true
      @previous = root_path
    else
      @previous = admin_denied_path
    end
  end

  def approve
    id = params[:id]
    @experience = Experience.find(id)
    @experience.update_attributes!({:approved => true, :denied => nil } )
    flash[:notice] = "Post has been approved!"
    redirect_to admin_unapproved_path
  end

  def deny
    id = params[:id]
    @experience = Experience.find(id)
    @user = User.find(@experience[:user_id])
    UserMailer.deny_email(@user).deliver
    flash[:notice] = "Post has been denied, student has been notified"
    @experience[:approved] = nil
    @experience[:denied] = true
    @experience.save()
    redirect_to admin_unapproved_path
  end

  def destroy
    id = params[:id]
    @experience = Experience.find(id)
    @experience.destroy()
    redirect_to admin_denied_path
    end

  def edit
    @experience = Experience.find params[:id]
  end

  def update
    @experience = Experience.find params[:id]
    if @experience.denied
       @experience[:approved] = nil
    end
    @experience.update_attributes!(params[:experience])
    flash[:notice] = "Post has been changed!"
    redirect_to "/admin/#{@experience.id}"
  end

  private

  def require_admin
    unless User.find(session[:user_id]).is_admin?
      flash[:error] = "You must be an admin in to access this section"
      redirect_to :root
    end
  end

end





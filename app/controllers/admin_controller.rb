require 'gmail_xoauth'
class AdminController < UsersController
  before_filter :require_admin
  include UsersHelper

  def home
    sort = params[:sort] || session[:sort] || :updated_at   
     
    session[:sort] = sort
    ordering = choose_ordering(sort)  || {:order => :updated_at}
    exp = Experience.where("approved = ?", true)
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




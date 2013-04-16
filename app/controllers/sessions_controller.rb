require 'omniauth'
class SessionsController < ApplicationController
  def new
  end

  def create
	  auth_hash = request.env['omniauth.auth'] 
	  if session[:user_id]
	    # Means our user is signed in. Add the authorization to the user
	    User.find(session[:user_id]).add_provider(auth_hash)
	 	redirect_to :root
	    # render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
	  else
	    # Log him in or sign him up
	    auth = Authorization.find_or_create(auth_hash)
	    # Create the session
	    if auth
	    	session[:user_id] = auth.user_id
	    	# if auth_hash["info"]["email"] =~ /ccs@colgate.edu/
	    	# 	session[:admin] = 
	    end
	 	redirect_to :root
	    # render :text => "Welcome #{auth.user.name}!"
	  end
  end

  def failure
  	render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
  	session[:user_id] = nil
  	render :text => "You've logged out!"
  end
end

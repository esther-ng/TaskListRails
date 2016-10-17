class SessionsController < ApplicationController
  def index
    if session[:user_id].nil?
      @logged_in = false
    else
      @logged_in = true
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    redirect to login_failure_path unless auth_hash['uid']
    # if auth_hash['uid'].nil?

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save # if you have save in the method instead, you would be pivoting on the true/false return instead of using @user.save here
    end

    # Save the user ID in the session
    session[:user_id] = @user.id

    redirect_to tasks_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

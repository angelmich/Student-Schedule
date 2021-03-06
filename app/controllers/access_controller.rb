class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
        found_user = Admin.where(:username => params[:username]).first
        if found_user
          authorized_user = found_user.authenticate(params[:password])
        end
    end
    if authorized_user
      session[:admin_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "Logged in"
      redirect_to cms_path
    else
      flash[:alert] = "Invalide username or password"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:admin_id] = nil
    session[:username] = nil
    flash[:notice] = "logged out"
    redirect_to(:action => "login")
  end

  private

  def confirm_logged_in
    unless session[:admin_id]
      flash[:notice] = "You need to log in"
      redirect_to(:action => 'login')
      return false
    else
      return true
    end
  end

end

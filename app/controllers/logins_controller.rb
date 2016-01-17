class LoginsController < ApplicationController
  
  def new
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "You are logged in."
      redirect_to recipes_path
    else
      flash[:danger] = "Invalid login."
      redirect_to login_path
    end
  end
  
  def distroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
  
end
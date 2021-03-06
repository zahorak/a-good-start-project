class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(current_user.id)
  end
  
  def detail
    @locality = Locality.find(params[:locality_id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to users_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      if current_user.category == "A"
        redirect_to users_url
      else
        redirect_to user_url
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end

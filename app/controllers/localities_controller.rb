class LocalitiesController < ApplicationController
  def index
    @localities = Locality.all
  end
  
  def show
    @locality = Locality.find(params[:id])
  end
  
  def new
    @locality = Locality.new
  end
  
  def create
    @locality = Locality.new(params[:locality])
    if @locality.save
      flash[:notice] = "Successfully created locality."
      redirect_to localities_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @locality = Locality.find(params[:id])
  end
  
  def update
    @locality = Locality.find(params[:id])
    if @locality.update_attributes(params[:locality])
      flash[:notice] = "Successfully updated locality."
      redirect_to localities_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @locality = Locality.find(params[:id])
    @locality.destroy
    flash[:notice] = "Successfully destroyed locality."
    redirect_to localities_url
  end
end

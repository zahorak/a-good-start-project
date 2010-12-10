class FamilyProfilesController < ApplicationController
  def index
    @family_profiles = FamilyProfile.all
  end
  
  def show
    @family_profile = FamilyProfile.find(params[:id])
  end
  
  def new
    @family_profile = FamilyProfile.new
  end
  
  def create
    @family_profile = FamilyProfile.new(params[:family_profile])
    if @family_profile.save
      flash[:notice] = "Successfully created family profile."
      redirect_to family_profiles_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @family_profile = FamilyProfile.find(params[:id])
  end
  
  def update
    @family_profile = FamilyProfile.find(params[:id])
    if @family_profile.update_attributes(params[:family_profile])
      flash[:notice] = "Successfully updated family profile."
      redirect_to family_profiles_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @family_profile = FamilyProfile.find(params[:id])
    @family_profile.destroy
    flash[:notice] = "Successfully destroyed family profile."
    redirect_to family_profiles_url
  end
end

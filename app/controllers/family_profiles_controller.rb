class FamilyProfilesController < ApplicationController
  def index
    if current_user.category == 'A'
      @family_profiles = FamilyProfile.all
    else
      if current_user.localities.blank?
        @family_profiles = current_user.families.order(:family_name)
      else
        @family_profiles = FamilyProfile.where(:locality_id => current_user.locality_ids)
      end
    end
  end
  
  def show
    @family_profile = FamilyProfile.find(params[:id])
  end
  
  def new
    @family_profile = FamilyProfile.new
  end
  
  def create
    @family_profile = FamilyProfile.new(params[:family_profile])
    @family_profile.created_by =  current_user.id

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
  
  def update_mini
    @family_profile = FamilyProfile.find(params[:id])
    if params[:non_formal_education] == "1"
      if @family_profile.non_formal_education == 1
        @family_profile.non_formal_education = 0
      else
        @family_profile.non_formal_education = 1
      end
    end
    if params[:workshops_on_education] == "1"
      if @family_profile.workshops_on_education == 1
        @family_profile.workshops_on_education = 0
      else
        @family_profile.workshops_on_education = 1
      end
    end
    if params[:parental_involment_in_preschool] == "1"
      if @family_profile.parental_involment_in_preschool == 1
        @family_profile.parental_involment_in_preschool = 0
      else
        @family_profile.parental_involment_in_preschool = 1
      end
    end
    @family_profile.save
    redirect_to :action => 'index'
  end
  
  def destroy
    @family_profile = FamilyProfile.find(params[:id])
    @family_profile.destroy
    flash[:notice] = "Successfully destroyed family profile."
    redirect_to family_profiles_url
  end
end

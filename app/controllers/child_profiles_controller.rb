class ChildProfilesController < ApplicationController
  # GET /child_profiles
  # GET /child_profiles.xml
  def index
    @child_profiles = ChildProfile.all
#    flash[:notice] = t("hello")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @child_profiles }
    end
  end

  # GET /child_profiles/1
  # GET /child_profiles/1.xml
  def show
    @child_profile = ChildProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @child_profile }
    end
  end

  # GET /child_profiles/new
  # GET /child_profiles/new.xml
  def new
    @child_profile = ChildProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @child_profile }
    end
  end

  # GET /child_profiles/1/edit
  def edit
    @child_profile = ChildProfile.find(params[:id])
  end

  # POST /child_profiles
  # POST /child_profiles.xml
  def create
    @child_profile = ChildProfile.new(params[:child_profile])

    respond_to do |format|
      if @child_profile.save
        format.html { redirect_to(child_profiles_path, :notice => 'Child profile was successfully created.') }
        format.xml  { render :xml => @child_profile, :status => :created, :location => @child_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @child_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /child_profiles/1
  # PUT /child_profiles/1.xml
  def update
    @child_profile = ChildProfile.find(params[:id])

    respond_to do |format|
      if @child_profile.update_attributes(params[:child_profile])
        format.html { redirect_to(child_profiles_path, :notice => 'Child profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @child_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /child_profiles/1
  # DELETE /child_profiles/1.xml
  def destroy
    @child_profile = ChildProfile.find(params[:id])
    @child_profile.destroy

    respond_to do |format|
      format.html { redirect_to(child_profiles_url) }
      format.xml  { head :ok }
    end
  end
end

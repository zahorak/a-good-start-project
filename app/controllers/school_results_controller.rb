class SchoolResultsController < ApplicationController
  
  def index
    @school_results = SchoolResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_results }
    end
  end

  def show
    @school_result = SchoolResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_result }
    end
  end

  def new
    unless params[:child_id].blank?
      child = ChildProfile.find(params[:child_id])
      @school_result = SchoolResult.new(:child_id => params[:child_id], :institution_id => child.institution_id)
    else
      render :text => 'No Child ID provided!'
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_result }
    end
  end

  def edit
    @school_result = SchoolResult.find(params[:id])
  end

  def create
    @school_result = SchoolResult.new(params[:school_result])
    @school_result.created_by =  current_user.id

    respond_to do |format|
      if @school_result.save
        format.html { redirect_to(school_results_url, :notice => 'School result was successfully created.') }
        format.xml  { render :xml => @school_result, :status => :created, :location => @school_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @school_result = SchoolResult.find(params[:id])

    respond_to do |format|
      if @school_result.update_attributes(params[:school_result])
        format.html { redirect_to(school_results_url, :notice => 'School result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @school_result = SchoolResult.find(params[:id])
    @school_result.destroy

    respond_to do |format|
      format.html { redirect_to(school_results_url) }
      format.xml  { head :ok }
    end
  end
end

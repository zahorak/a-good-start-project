class SchoolResultsController < ApplicationController
  
  # GET /school_results
  # GET /school_results.xml
  def index
    @school_results = SchoolResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_results }
    end
  end

  # GET /school_results/1
  # GET /school_results/1.xml
  def show
    @school_result = SchoolResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_result }
    end
  end

  # GET /school_results/new
  # GET /school_results/new.xml
  def new
    @school_result = SchoolResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_result }
    end
  end

  # GET /school_results/1/edit
  def edit
    @school_result = SchoolResult.find(params[:id])
  end

  # POST /school_results
  # POST /school_results.xml
  def create
    @school_result = SchoolResult.new(params[:school_result])

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

  # PUT /school_results/1
  # PUT /school_results/1.xml
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

  # DELETE /school_results/1
  # DELETE /school_results/1.xml
  def destroy
    @school_result = SchoolResult.find(params[:id])
    @school_result.destroy

    respond_to do |format|
      format.html { redirect_to(school_results_url) }
      format.xml  { head :ok }
    end
  end
end

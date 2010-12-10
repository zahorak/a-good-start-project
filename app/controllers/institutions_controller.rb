class InstitutionsController < ApplicationController
  # GET /institutions
  # GET /institutions.xml
  def index
    if params[:category]
      @institutions = Institution.all(:order => :name, :conditions => (["code_id=?",(params[:category])]))
    else
      @institutions = Institution.all(:order => :name)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @institutions }
    end
  end

  # GET /institutions/1
  # GET /institutions/1.xml
  def show
    @institution = Institution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @institution }
    end
  end

  # GET /institutions/new
  # GET /institutions/new.xml
  def new
    @institution = Institution.new
    if params[:origin_id]
      @institution.locality_id = Survey.find(params[:origin_id]).locality_id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @institution }
    end
  end

  # GET /institutions/1/edit
  def edit
    @institution = Institution.find(params[:id])
  end

  # POST /institutions
  # POST /institutions.xml
  def create
    @institution = Institution.new(params[:institution])

    respond_to do |format|
      if @institution.save
        unless params[:origin_id]
          format.html { redirect_to(institutions_url, :notice => 'Institution was successfully created.') }
          format.xml  { render :xml => @institution, :status => :created, :location => @institution }
        else
          format.html { redirect_to(edit_survey_url(params[:origin_id]), :notice => 'Institution was successfully created.') }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /institutions/1
  # PUT /institutions/1.xml
  def update
    @institution = Institution.find(params[:id])

    respond_to do |format|
      if @institution.update_attributes(params[:institution])
        format.html { redirect_to(institutions_url, :notice => 'Institution was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.xml
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    respond_to do |format|
      format.html { redirect_to(institutions_url) }
      format.xml  { head :ok }
    end
  end
end

class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.xml
  def index
    if current_user.category == 'A'
      @surveys = Survey.all
    else
      @surveys = Survey.find(:all, :conditions => {:created_by => current_user.id})
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  def show
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml

  def new
    @survey = Survey.new
    @survey.family=FamilyProfile.new
    # 3.times {@survey.children.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
    if @survey.current_step == 2
      unless notice=='Institution was successfully created.'
        @survey.number_of_children_below_seven.times {@survey.children.build(:family_id => @survey.family_id)}
      end
    end
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])
    @survey.created_by = current_user.id
    @survey.current_step = 2
    respond_to do |format|
      if @survey.save
        format.html { redirect_to(edit_survey_url(@survey), :notice => 'Survey was successfully saved.') }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new", :step => 1 }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(params[:id])
    unless params[:commit] == t('Add New Institution')
      @survey.current_step = params[:step]
    end
    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        if params[:commit] == t('Add New Institution')
          format.html { redirect_to(new_institution_path(:origin_id=>@survey.id))}
        else
          format.html { redirect_to(edit_survey_url(@survey), :notice => 'Survey was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end
end

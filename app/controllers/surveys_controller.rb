class SurveysController < ApplicationController

  def index
    # if current_user.category == 'A'
    #   @surveys = Survey.all
    # elsif current_user.category == 'L'
      # @surveys = Survey.find(:all, :conditions => "locality_id in(" + current_user.localities + ")")
      @incomplete_surveys = current_user.my_surveys.where('completed is null')
      @completed_surveys = current_user.my_surveys.where('completed = 1')
    # else
    # @columns = []
     # @surveys = Survey.where(:completed => 1).limit(5)
     if current_user.category == 'A'
       if params[:locality_id]
         @children = ChildProfile.where(:locality_id => params[:locality_id])
       else
         @children = ChildProfile.where(:locality_id => [9,10,11,12,13])
       end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
      format.xls
    end
  end

  def show
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  def new
    @survey = Survey.new
    @survey.family = FamilyProfile.new(:created_by => current_user.id)
    # 3.times {@survey.children.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    # tu uz je params[:step] navysena o 1, ako som to urobil pri redirecte v UPDATE
    session[:survey_mediator_survey_counter] = @survey.mediator_survey_counter
    session[:mediator] = @survey.interviewer_id
    if current_user.id == @survey.created_by or (current_user.localities.include? @survey.locality) or current_user.category == 'A'
      @step = params[:step].blank? ? 1 : params[:step]
      if params[:step] == "3"
        # if @survey.family.blank?
        #   @survey.family = FamilyProfile.new(:survey_id => @survey.id)
        # end
        # diff = @survey.children.size - @survey.number_of_children_below_seven
        # if diff > 0
        #   diff_children = diff.times{ ChildProfile.new(:created_by => current_user.id, :family_id => @survey.family_id, :locality_id => @survey.locality_id) }
        # end
        # logger.info 'diff<<<<<<<<<<<<<<<' + diff_children.inspect
        # logger.info 'db <<<<<<<<<<<<<<< ' + @survey.number_of_children_below_seven.to_s
        # logger.info 'children <<<<<<<<<<<<<<< ' + @survey.children.size.to_s
        if @survey.children.size == 0 
          @survey.number_of_children_below_seven.times {@survey.children.build(:created_by => current_user.id, :family_id => @survey.family_id, :locality_id => @survey.locality_id)}
        else
          (@survey.number_of_children_below_seven - @survey.children.size).times {@survey.children.build(:created_by => current_user.id, :family_id => @survey.family_id, :locality_id => @survey.locality_id)}
        end
        # logger.info 'children new >>>> ' + @survey.children.size.to_s
        # unless notice=='Institution was successfully created.'
        #   @survey.number_of_children_below_seven.times {@survey.children.build(:family_id => @survey.family_id)}
        # end
      end
    else
      render :text => 'You cannot edit this survey, because you did not create it.'
    end
  end

  def create
    # verify whether survey with this interviewer_id and location_id already exists / for doubleclickers
    @exists_survey_with_given_mediator_survey_counter_and_location = Survey.where(:mediator_survey_counter  => params[:survey][:mediator_survey_counter], :interviewer_id => params[:survey][:interviewer_id], :locality_id => params[:survey][:locality_id]).first
    unless @exists_survey_with_given_mediator_survey_counter_and_location.blank?
      @survey = Survey.new(params[:survey])
      @survey.family = FamilyProfile.new(:created_by => current_user.id)
      @survey.created_by = current_user.id
      redirect_to surveys_url, :notice => t('This survey was already saved. Please click Submit Button only once. Select survey from the list below.')
    else
      @survey = Survey.new(params[:survey])
      @survey.created_by = current_user.id
      @survey.current_step = 2

      respond_to do |format|
        if @survey.save
          @survey.family.update_attributes(:survey_id => @survey.id,:locality_id => @survey.locality_id)
          format.html { redirect_to(edit_survey_url(@survey)+'?step='+(params[:step]), :notice => 'Survey was successfully saved.') }
          format.xml  { render :xml => @survey, :status => :created, :location => @survey }
        else
          format.html { render :action => "new", :step => 1 }
          format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update
    @survey = Survey.find(params[:id])
    unless params[:commit] == t('Add New Institution')
      if params[:step]
        unless @survey.current_step > params[:step].to_i
          @survey.current_step = params[:step]
        end
      end
    end

    if params[:commit] == t('Save and Mark Survey as Completed')
      @survey.completed = 1
      if @survey.locality.survey_count == @survey.locality.completed_surveys.count + 1
        UserMailer.number_reached(current_user,@survey).deliver  
        UserMailer.number_reached(current_user.boss,@survey).deliver  unless current_user.boss.blank?
      end      
      UserMailer.new_survey(current_user,@survey).deliver  
    end

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        session[:survey_mediator_survey_counter] = nil
        session[:mediator] = nil
        @survey.family.update_attributes(:locality_id => @survey.locality_id)
        if params[:commit] == t('Add New Institution')
          format.html { redirect_to(new_institution_path(:origin_id=>@survey.id))}
        elsif params[:commit] == t("Save and Next")
          format.html { redirect_to(edit_survey_url(@survey)+'?step='+(params[:step].to_i+1).to_s, :notice => t('Survey was successfully updated.')) }
        elsif params[:commit] == t("Save and Add New Survey")
          format.html { redirect_to new_survey_url, :notice => t('Survey was successfully updated.') }
        elsif params[:commit] == t("Save and Mark Survey as Completed")
          format.html { redirect_to surveys_url, :notice => t('Survey was saved and marked as completed') }
        else
          format.html { redirect_to(edit_survey_url(@survey)+'?step='+params[:step].to_s, :notice => t('Survey was successfully updated.')) }
          format.xml  { head :ok }
        end
      else
        format.html { redirect_to(edit_survey_url(@survey)+'?step='+params[:step], :notice => t('There was a problem to save data.')) }
      end
    end

  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end
  
  def check_survey_number
    session[:survey_mediator_survey_counter] = params[:survey][:mediator_survey_counter]
    unless params[:s].blank?
      @survey = Survey.find(params[:s])
      @survey_with_given_mediator_survey_counter = Survey.where(:mediator_survey_counter  => params[:survey][:mediator_survey_counter], :interviewer_id => session[:mediator], :locality_id => session[:locality_id]).first
      if @survey_with_given_mediator_survey_counter
        number_exists = (@survey.id == @survey_with_given_mediator_survey_counter.id ? nil : @survey_with_given_mediator_survey_counter)
      else
        number_exists = nil
      end
    else
      number_exists = Survey.where(:mediator_survey_counter  => params[:survey][:mediator_survey_counter], :interviewer_id => session[:mediator], :locality_id => session[:locality_id])
    end
    if number_exists.blank? 
      render :text => 'true'
    else
      render :text => 'false'
    end
  end

  def mark_as_verified
    if params[:id]
      @survey = Survey.find(params[:id])
      @survey.update_attributes(:verified => 1)
      UserMailer.new_survey(current_user,@survey).deliver  
      redirect_to surveys_url
    else
      render :text => 'no id provided'
    end
  end

  def mark_for_delete
    if params[:id]
      @survey = Survey.find(params[:id])
      if @survey.marked_for_delete.blank?
        @survey.update_attributes(:marked_for_delete => 1)
      else
        @survey.update_attributes(:marked_for_delete => nil)
      end
      redirect_to surveys_url
    else
      render :text => 'no id provided'
    end
  end
  
  def save_locality_id_to_session
    session[:locality_id] = params[:survey][:locality_id]
    unless params[:s].blank?
      @survey = Survey.find(params[:s])
    end
    render :text => 'true'
    
  end
  
  def save_mediator_to_session
    session[:mediator] = params[:survey][:interviewer_id]
    unless params[:s].blank?
      @survey = Survey.find(params[:s])
    end
    render :text => 'true'
  end

end


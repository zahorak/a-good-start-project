class InstitutionsController < ApplicationController
  def index
    # if current_user.category == 'A'
    #   if params[:category]
    #     @institutions = Institution.all(:order => 'locality_id,code_id,name', :conditions => (["code_id=?",(params[:category])]))
    #   else
    #     @institutions = Institution.all(:order => 'locality_id,code_id,name')
    #   end
    # elsif current_user.category == 'L'
    #   if params[:category]
    #     @institutions = Institution.all(:order => :name, :conditions => (["code_id=?",(params[:category])]))
    #   else
    #     @institutions = Institution.find(:all, :conditions => "locality_id in(" + current_user.localities + ")", :order => 'locality_id,code_id,name')
    #   end
    # elsif  current_user.category == 'LDB'
    #   @institutions = Institution.find(:all, :conditions => {:locality_id => current_user.locality_id}, :order=> 'locality_id,code_id,name')
    # elsif ['REF','ME'].include? current_user.category
      if params[:category]
        @institutions = Institution.all(:order => :name, :conditions => (["locality_id in(?) and code_id=?", current_user.locality_ids*",", params[:category]]))
      else
        @institutions = Institution.find(:all, :conditions => "locality_id in(" + current_user.locality_ids*"," + ")", :order => 'locality_id,code_id,name')
      end
    # end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @institutions }
    end
  end

  def show
    @institution = Institution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @institution }
    end
  end

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

  def edit
    @institution = Institution.find(params[:id])
  end

  def edit_children
    @date = Date.today.ago(1.month).beginning_of_month
    session[:attendance_period] = @date
    @institution = Institution.find(params[:id])
    @attendance_result_post = AttendanceResult.new(:attendance_period => @date, :institution_id => params[:id])
  end

  def set_date_to_session
    @date =  Date.new(params[:date][:attendance_period][:year].to_i, params[:date][:attendance_period][:month].to_i,1)
    session[:attendance_period] = @date
    redirect_to :back
  end
  
  def show_children_form
    @ch = ChildProfile.find(params[:child_id])
    ap = params[:attendance_period] ? params[:attendance_period] : session[:attendance_period]
    if params[:attendance_result_id]
      @attendance_result = AttendanceResult.find(params[:attendance_result_id])
    end
    # @attendance_result = AttendanceResult.where(:attendance_period => ap, :child_id => @ch.id).first
    if @attendance_result.blank?
      @attendance_result = AttendanceResult.new(:child_id => params[:child_id], :attendance_period => ap, :institution_id => params[:institution_id])
    end
  end
  
  def create
    @institution = Institution.new(params[:institution])
    @institution.created_by =  current_user.id
    respond_to do |format|
      if @institution.save
        unless params[:origin_id]
          format.html { redirect_to(institutions_url, :notice => t('Institution was successfully created.')) }
          format.xml  { render :xml => @institution, :status => :created, :location => @institution }
        else
          format.html { redirect_to(edit_survey_url(params[:origin_id],:step => 2), :notice => 'Institution was successfully created.') }
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

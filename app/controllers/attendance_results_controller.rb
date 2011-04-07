class AttendanceResultsController < ApplicationController
  def index
    @attendance_results = AttendanceResult.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendance_results }
    end
  end

  def show
    @attendance_result = AttendanceResult.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance_result }
    end
  end

  def new
    @attendance_result = AttendanceResult.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance_result }
    end
  end

  def edit
    @attendance_result = AttendanceResult.find(params[:id])
  end

  def create
    @attendance_result = AttendanceResult.new(params[:attendance_result])
    @attendance_result.created_by =  current_user.id
    @ch = params[:attendance_result][:child_id]
    @attendance_results = ChildProfile.find(params[:attendance_result][:child_id]).attendance_results
    @ar_exists = AttendanceResult.where(:attendance_period => @attendance_result.attendance_period, :child_id => @attendance_result.child_id)
    if @ar_exists.blank?
      respond_to do |format|
        if @attendance_result.save
          @last_month = AttendanceResult.where(:child_id => params[:attendance_result][:child_id], :attendance_period => Date.today.ago(1.month).beginning_of_month, :institution_id => params[:attendance_result][:institution_id]).first
          @ich = @attendance_result.child_profile
          format.html { redirect_to('/institutions/'+@attendance_result.institution_id.to_s+'/edit_children', :notice => 'Attendance result was successfully created.') }
          format.xml  { render :xml => @attendance_result, :status => :created, :location => @attendance_result }
          format.js 
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @attendance_result.errors, :status => :unprocessable_entity }
          format.js 
        end
      end
    else
      @message = t('This month is already entered') 
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @attendance_result = AttendanceResult.find(params[:id])
    logger.info @attendance_result.child_profile.inspect
    # unless @attendance_result.child_id.blank?
      @attendance_results = @attendance_result.child_profile.attendance_results
    # end
    respond_to do |format|
      if @attendance_result.update_attributes(params[:attendance_result])
        format.html { redirect_to(attendance_results_path, :notice => 'Attendance result was successfully updated.') }
        format.js 
      else
        format.html { render :action => "edit" }
        format.js 
      end
    end
  end

  def destroy
    @attendance_result = AttendanceResult.find(params[:id])
    @attendance_result.destroy
    respond_to do |format|
      format.html { redirect_to(attendance_results_url) }
      format.xml  { head :ok }
    end
  end
end

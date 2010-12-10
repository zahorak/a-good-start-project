class AttendanceResultsController < ApplicationController
  # GET /attendance_results
  # GET /attendance_results.xml
  def index
    @attendance_results = AttendanceResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendance_results }
    end
  end

  # GET /attendance_results/1
  # GET /attendance_results/1.xml
  def show
    @attendance_result = AttendanceResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance_result }
    end
  end

  # GET /attendance_results/new
  # GET /attendance_results/new.xml
  def new
    @attendance_result = AttendanceResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance_result }
    end
  end

  # GET /attendance_results/1/edit
  def edit
    @attendance_result = AttendanceResult.find(params[:id])
  end

  # POST /attendance_results
  # POST /attendance_results.xml
  def create
    @attendance_result = AttendanceResult.new(params[:attendance_result])

    respond_to do |format|
      if @attendance_result.save
        format.html { redirect_to(attendance_results_path, :notice => 'Attendance result was successfully created.') }
        format.xml  { render :xml => @attendance_result, :status => :created, :location => @attendance_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendance_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_results/1
  # PUT /attendance_results/1.xml
  def update
    @attendance_result = AttendanceResult.find(params[:id])

    respond_to do |format|
      if @attendance_result.update_attributes(params[:attendance_result])
        format.html { redirect_to(attendance_results_path, :notice => 'Attendance result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_results/1
  # DELETE /attendance_results/1.xml
  def destroy
    @attendance_result = AttendanceResult.find(params[:id])
    @attendance_result.destroy

    respond_to do |format|
      format.html { redirect_to(attendance_results_url) }
      format.xml  { head :ok }
    end
  end
end

class EnrollmentOverTimesController < ApplicationController
  # GET /enrollment_over_times
  # GET /enrollment_over_times.xml
  def index
    @enrollment_over_times = EnrollmentOverTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enrollment_over_times }
    end
  end

  # GET /enrollment_over_times/1
  # GET /enrollment_over_times/1.xml
  def show
    @enrollment_over_time = EnrollmentOverTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enrollment_over_time }
    end
  end

  # GET /enrollment_over_times/new
  # GET /enrollment_over_times/new.xml
  def new
    @enrollment_over_time = EnrollmentOverTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enrollment_over_time }
    end
  end

  # GET /enrollment_over_times/1/edit
  def edit
    @enrollment_over_time = EnrollmentOverTime.find(params[:id])
  end

  # POST /enrollment_over_times
  # POST /enrollment_over_times.xml
  def create
    @enrollment_over_time = EnrollmentOverTime.new(params[:enrollment_over_time])

    respond_to do |format|
      if @enrollment_over_time.save
        format.html { redirect_to(enrollment_over_times_path, :notice => 'Enrollment over time was successfully created.') }
        format.xml  { render :xml => @enrollment_over_time, :status => :created, :location => @enrollment_over_time }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enrollment_over_time.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enrollment_over_times/1
  # PUT /enrollment_over_times/1.xml
  def update
    @enrollment_over_time = EnrollmentOverTime.find(params[:id])

    respond_to do |format|
      if @enrollment_over_time.update_attributes(params[:enrollment_over_time])
        format.html { redirect_to(enrollment_over_times_path, :notice => 'Enrollment over time was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enrollment_over_time.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollment_over_times/1
  # DELETE /enrollment_over_times/1.xml
  def destroy
    @enrollment_over_time = EnrollmentOverTime.find(params[:id])
    @enrollment_over_time.destroy

    respond_to do |format|
      format.html { redirect_to(enrollment_over_times_url) }
      format.xml  { head :ok }
    end
  end
end

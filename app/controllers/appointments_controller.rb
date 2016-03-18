class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctor = Doctor.find(params[:doctor_id]) 
    @appointments = @doctor.appointments.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
   @appointment = Appointment.find(params[:id])
   @doctor = Doctor.find(params[:doctor_id])   
  end

  # GET /doctors/new
  def new
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:doctor_id])
  end

  # GET /doctors/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
    @doctor = Doctor.find(params[:doctor_id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.where(id: params[:doctor_id]).first
    @appointment = @doctor.appointments.build(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to doctor_appointment_path(@doctor,@appointment), notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    @doctor = Doctor.where(id: params[:doctor_id]).first
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to doctor_appointment_path(@hospital,@doctor), notice: 'Appointment successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
    format.html { redirect_to doctor_appointments_path(@doctor), notice: 'Appointment was successfully cancelled.' } 
    format.json { head :no_content }
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:patient, :problem)
    end
end

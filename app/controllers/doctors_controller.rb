class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @hospital = Hospital.find(params[:hospital_id]) 
    @doctors = @hospital.doctors.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
   @doctor=Doctor.find(params[:id])
   @hospital = Hospital.find(params[:hospital_id])   
   @doctors = Doctor.where(:id => params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @doctors.to_csv2 }
    end
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
    @hospital = Hospital.find(params[:hospital_id])
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
    @hospital = Hospital.find(params[:hospital_id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @hospital = Hospital.where(id: params[:hospital_id]).first
    @doctor = @hospital.doctors.build(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to hospital_doctor_path(@hospital,@doctor), notice: 'Doctor was successfully created.' }
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
    @hospital = Hospital.where(id: params[:hospital_id]).first
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to hospital_doctor_path(@hospital,@doctor), notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @hospital=Hospital.find(params[:hospital_id])
    @doctor=Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
    format.html { redirect_to hospital_doctors_path(@hospital), notice: 'Doctor list updated successfully' } 
    format.json { head :no_content }
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:name, :contact)
    end
end

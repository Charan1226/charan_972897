class HospitalsController < ApplicationController

  def index
    @hospital=Hospital.all
    respond_to do |format|
    format.html
    format.csv { send_data @hospital.to_csvs }
    end
  end
  
  

  def home
  end

  def help
  end

  def contact
  end

  def about
  end

 

  def show
    @hospital = Hospital.find(params[:id])
    @hospitals = Hospital.where(:id => params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @hospitals.to_csv }
    end
  end

  def new
    @hospital = Hospital.new
  end

  
end

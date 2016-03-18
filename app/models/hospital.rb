require "csv"
class Hospital < ActiveRecord::Base
  has_many :doctors
  def self.to_csv(options={})
  	 CSV.generate(options) do |row|
  		row << ["Hospital", "Branch Name","Doctors"]
  	     
  		    #all.each do |hospital|
  		    self.first.doctors.each do |doctor|
      		
        	row << [self.first.name, self.first.branch,doctor.name]     		

    		#end
    	end
  		
  	end
  end

  def self.to_csvs(options={})
    CSV.generate(options) do |row|
      row << [ "Care Branch","Doctor","Branch"]
      all.each do |hospital|
        hospital.doctors.each do |doctor|
          
            row << [hospital.branch, doctor.name]
          
        end
      end
    end
  end 


end

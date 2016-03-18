require "csv"
class Doctor < ActiveRecord::Base
	belongs_to :hospitals
	has_many :appointments
  validates :name, presence: true
  validates :contact, presence: true ,:length => { :minimum => 10, :maximum => 10 ,:alert => 'incorrect number' }
  validates_format_of :contact, :with =>  /\d[7-9][0-9]\)*\z/ , :message => "Only valid phone numbers are allowed"
	def self.to_csv2(options={})
  	 CSV.generate(options) do |row|
  		row << ["Doctor","Appointment"]
  		
  			
      		  self.first.appointments.each do |appointment|
        		row << [self.first.name,appointment.patient]
      		 end
    		
  		
  	end
  end 
end

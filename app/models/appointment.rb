class Appointment < ActiveRecord::Base
	belongs_to :doctor
	validates :patient, presence: true , :length => {:maximum => 20 ,:alert => 'Name is too long' }
	validates :problem, presence: true , :length => {:maximum => 400 ,:alert => 'Too long description' } , :length => { :minimum => 5,:alert => 'Too long description' } 
end

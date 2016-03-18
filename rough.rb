require "csv"
file_name = "Appointments.csv"
CSV.open("#{Rails.root}/tmp/#{file_name}", "wb", {col_sep: ','}) do |row|
  row << ["Hospital" ,"Location", "Doctor", "Appointment"]
  Hospital.all.each do |hospital|
    hospital.doctors.each do |doctor|
      doctor.appointments.each do |appointment|
        row << [hospital.name,hospital.branch, doctor.name, appointment.patient]
      end
    end
  end
end 
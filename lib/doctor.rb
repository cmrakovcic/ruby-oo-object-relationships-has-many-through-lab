class Doctor
  attr_accessor :name
  @@all=[]

  def initialize(name)
    @name = name
    @appointments = []
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    appointment = Appointment.new(patient, date, self)
    @appointments << appointment
    appointment
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end

  def patients
    @appointments.map do |appointment|
      appointment.patients
      end
    end 
end
class AppointmentsController < ApplicationController
  def index
    @citas = Appointment.all
  end
end

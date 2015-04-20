# == Schema Information
#
# Table name: appointments
#
#  id           :integer          not null, primary key
#  consejero_id :integer
#  alumno_id    :integer
#  fecha        :datetime
#  estado       :string(255)
#  reporte      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

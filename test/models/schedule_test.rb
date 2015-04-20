# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  dia_semana  :string(255)
#  hora_inicio :time
#  hora_fin    :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

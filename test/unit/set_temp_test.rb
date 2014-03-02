# == Schema Information
#
# Table name: set_temps
#
#  id         :integer          not null, primary key
#  room       :string(255)
#  reading    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SetTempTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

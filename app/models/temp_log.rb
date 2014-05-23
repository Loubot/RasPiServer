# == Schema Information
#
# Table name: temp_logs
#
#  id         :integer          not null, primary key
#  room       :string(255)
#  reading    :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TempLog < ActiveRecord::Base
  attr_accessible :reading, :room
end

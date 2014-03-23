class ChangeTempTypeInTempLogs < ActiveRecord::Migration
  def up
  	change_column :temp_logs, :reading, :decimal, :precision => 10, :scale => 2 
  end

  def down
  end
end

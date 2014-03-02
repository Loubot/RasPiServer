class CreateTempLogs < ActiveRecord::Migration
  def change
    create_table :temp_logs do |t|
      t.string :room
      t.integer :reading

      t.timestamps
    end
  end
end

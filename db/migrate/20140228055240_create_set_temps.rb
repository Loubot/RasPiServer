class CreateSetTemps < ActiveRecord::Migration
  def change
    create_table :set_temps do |t|
      t.string :room
      t.integer :reading

      t.timestamps
    end
  end
end

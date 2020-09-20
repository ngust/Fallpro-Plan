class CreateFallproHazards < ActiveRecord::Migration[5.1]
  def change
    create_table :fallpro_hazards do |t|
      t.references :fallpro, foreign_key: true
      t.float :height
      t.string :units
      t.string :surface
      t.boolean :can_drop
      t.string :drop_strike
      t.boolean :power_lines
      t.boolean :holes
      t.string :hole_control
      t.boolean :control_zone
      t.string :cz_measures
      t.boolean :signage
      t.string :sig_measures
      t.string :fall_protection
      t.boolean :training
      t.boolean :signup

      t.timestamps
    end
  end
end

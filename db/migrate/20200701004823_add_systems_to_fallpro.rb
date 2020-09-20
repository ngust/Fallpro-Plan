class AddSystemsToFallpro < ActiveRecord::Migration[5.1]
  def change
  	add_column :fallpros, :gaurdrails, :boolean
	add_column :fallpros, :fall_restraint, :boolean
	add_column :fallpros, :fall_arrest, :boolean
	add_column :fallpros, :control_zone, :boolean
	add_column :fallpros, :control_drop_zone, :boolean
  end
end

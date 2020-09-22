class AddSetupToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :all_read, :boolean
    add_column :fallpros, :safe_area, :boolean
    add_column :fallpros, :parts_compatible, :boolean
    add_column :fallpros, :steps_reverse, :boolean
  end
end

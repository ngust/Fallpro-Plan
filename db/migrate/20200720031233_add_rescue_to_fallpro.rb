class AddRescueToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :rescue, :boolean
    add_column :fallpros, :how_rescue, :text
  end
end

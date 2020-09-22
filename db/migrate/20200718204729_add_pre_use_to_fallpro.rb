class AddPreUseToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :strong_enough, :boolean
    add_column :fallpros, :equipment_inspected, :boolean
    add_column :fallpros, :after_breaks, :boolean
  end
end

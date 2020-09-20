class AddItemsToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :anchor_structure, :string
    add_column :fallpros, :anchor_connection, :string
    add_column :fallpros, :full_body_harness, :boolean
    add_column :fallpros, :connect_anchor, :string
    add_column :fallpros, :lifeline, :string
    add_column :fallpros, :rope_grab, :boolean
    add_column :fallpros, :lanyard, :string
    add_column :fallpros, :lanyard_type, :string
    add_column :fallpros, :tool_lanyard, :boolean
    add_column :fallpros, :matarial_tie, :boolean
    add_column :fallpros, :control_zone_item, :boolean
  end
end

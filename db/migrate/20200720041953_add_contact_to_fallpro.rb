class AddContactToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :contact_name, :string
    add_column :fallpros, :contact_number, :string
    add_column :fallpros, :contact_position, :string
    add_column :fallpros, :airhorn_location, :string
    add_column :fallpros, :radio_location, :string
  end
end

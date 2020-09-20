class AddInfoToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :add_info, :string
  end
end

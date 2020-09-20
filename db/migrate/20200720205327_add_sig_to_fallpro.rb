class AddSigToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :signature, :string
  end
end

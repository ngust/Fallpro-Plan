class AddSketchToFallpro < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpros, :sketch_upload, :string
  end
end

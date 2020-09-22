class ChangeSketchFallpro < ActiveRecord::Migration[5.1]
  def change
  	change_column :fallpros, :sketch, :string
  end
end

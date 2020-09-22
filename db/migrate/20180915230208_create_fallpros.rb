class CreateFallpros < ActiveRecord::Migration[5.1]
  def change
    create_table :fallpros do |t|
      t.string :supervisor
      t.string :company
      t.boolean :add_procedures
      t.boolean :picture
      t.boolean :sketch

      t.timestamps
    end
  end
end

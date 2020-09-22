class CreateFallproReverseSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :fallpro_reverse_steps do |t|
      t.integer :order
      t.string :body
      t.references :fallpro, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFallproEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :fallpro_emails do |t|
      t.string :email
      t.references :fallpro, foreign_key: true

      t.timestamps
    end
  end
end

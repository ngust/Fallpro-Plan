class CreateFallproSites < ActiveRecord::Migration[5.1]
  def change
    create_table :fallpro_sites do |t|
      t.string :project
      t.string :address
      t.string :prime
      t.string :cso_name
      t.string :cso_phone
      t.boolean :construction_site
      t.string :desc
      t.string :height
      t.string :units
      t.boolean :roof
      t.string :slope
      t.string :worktype
      t.string :created_by

      t.timestamps
    end
  end
end

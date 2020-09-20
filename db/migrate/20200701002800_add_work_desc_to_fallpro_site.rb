class AddWorkDescToFallproSite < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpro_sites, :work_desc, :string
  end
end

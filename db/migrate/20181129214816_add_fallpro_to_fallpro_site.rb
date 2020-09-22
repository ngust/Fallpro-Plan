class AddFallproToFallproSite < ActiveRecord::Migration[5.1]
  def change
    add_column :fallpro_sites, :fallpro, :integer
  end
end

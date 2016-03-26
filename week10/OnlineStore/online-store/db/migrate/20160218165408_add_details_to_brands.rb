class AddDetailsToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :name, :string
    add_column :brands, :description, :text
  end
end

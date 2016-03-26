class AddDetailsToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :name, :string
    add_column :lectures, :body, :text
  end
end

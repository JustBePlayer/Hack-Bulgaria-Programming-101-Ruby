class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :textblock
      t.belongs_to :task, index: true

      t.timestamps null: false
    end
  end
end

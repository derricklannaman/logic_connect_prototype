class CreateCodeLists < ActiveRecord::Migration[5.0]
  def change
    create_table :code_lists do |t|
      t.string :name
      t.string :code_system
      t.integer :count
      t.string :description

      t.timestamps
    end
  end
end

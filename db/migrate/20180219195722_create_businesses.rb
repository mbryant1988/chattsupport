class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :company
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end

class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.integer :date

      t.timestamps
    end
  end
end

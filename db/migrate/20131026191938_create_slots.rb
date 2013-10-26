class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :hour
      t.belongs_to :church
      t.belongs_to :user

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :type
      t.decimal :lat
      t.decimal :lng
      t.belongs_to :user

      t.timestamps
    end
  end
end

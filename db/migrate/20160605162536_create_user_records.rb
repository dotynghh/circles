class CreateUserRecords < ActiveRecord::Migration
  def change
    create_table :user_records do |t|
    	t.belongs_to :user
    	t.integer :blog_id
      t.timestamps null: false
    end
    add_index :user_records, [:user_id]
  end
end

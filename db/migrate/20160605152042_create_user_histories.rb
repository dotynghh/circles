class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
    	t.belongs_to :user
    	t.integer :blog_id
      t.timestamps null: false
    end
  end
end

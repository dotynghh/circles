class AddContentCountsToBlog < ActiveRecord::Migration
  def change
  	add_column :blogs, :content_counts, :integer, :default => 0, null:false
  end
end

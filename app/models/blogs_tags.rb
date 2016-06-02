class BlogsTags < ActiveRecord::Base
	self.table_name = "blogs_tags"

	belongs_to :tag
	belongs_to :blog
end
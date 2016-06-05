class UserRecord < ActiveRecord::Base
  self.table_name = "user_records"
  def initialize user_id, blog_id
    @user_id, @blog_id = user_id, blog_id
  end
  belongs_to :user
end

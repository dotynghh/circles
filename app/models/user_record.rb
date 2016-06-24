class UserRecord < ActiveRecord::Base

  self.table_name = "user_records"

  belongs_to :user

end

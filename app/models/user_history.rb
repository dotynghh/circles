class UserHistory < ActiveRecord::Base

  attr_accessor :user_id
  attr_accessor :blog_id

  def initialize user_id, blog_id
    @user_id = user_id
    @blog_id = blog_id
  end

  
end

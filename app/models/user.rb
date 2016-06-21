class User < ActiveRecord::Base

  validates :username, presence: { message: "用户名不能为空" }
  validates :username, uniqueness: { message: "用户名已存在" }

  has_many :blogs

  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :inboxes, class_name: :Message, foreign_key: :receiver_id
  has_many :outboxes, class_name: :Message, foreign_key: :receiver_id
  has_many :user_records, class_name: "UserRecord"
  has_many :public_blogs, -> { where(is_public: true) },
    class_name: "Blog"

  has_one :latest_blog,  -> { order("id desc") }, class_name: :Blog

  before_save :update_username
  attr_accessor :oldpassword
  attr_accessor :password
  attr_accessor :password_confirmation

  validate :validate_password, on: :create
  validate :change_password, on: :update
  before_create :set_password
  before_save :set_password

  def self.authenticate username, password
    user = find_by(username: username)
    if user and user.valid_password?(password)
      user
    else
      nil
    end
  end
  
  def add_friend user
    if self == user
      false
    else
      self.friends << user
      user.friends << self
    end

  end

  def is_friend_with? user
    self.friendships.exists?(friend_id: user.id)
    
  end

 def valid_password? password
    self.crypted_password == Digest::SHA256.hexdigest(password + self.salt)
  end


  private

  def change_password
    if valid_password? self.oldpassword
      password_isblank?
      password_notsame?
    end
    return true
  end

  def validate_password
    password_isblank?
    password_notsame?
    return true
  end

  def password_isblank?
    if self.password.blank?
      self.errors.add(:password, "密码不能为空")
      return false
    end
  end

  def password_notsame?
    unless self.password == self.password_confirmation
      self.errors.add(:password_confirmation, "密码不一致")
      return false
    end
  end

  def set_password
    self.salt = Time.now.to_i
    self.crypted_password = Digest::SHA256.hexdigest(self.password + self.salt)
  end


  def update_username
    self.username = self.username.downcase
  end
end

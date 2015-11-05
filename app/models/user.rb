class User < ActiveRecord::Base
  # has_many :recipes
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, {presence: true, uniqueness: true}
  validates :email, {presence: true, uniqueness: true}
  validates :hashed_password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
end

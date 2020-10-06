class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true 

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
end

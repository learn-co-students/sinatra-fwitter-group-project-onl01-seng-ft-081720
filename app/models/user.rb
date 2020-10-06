class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    username = self.username
    username.gsub(' ', '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find_by(:username => slug.split("-").join(" "))
  end
  
end

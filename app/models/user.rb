class User < ActiveRecord::Base
  attr_accessor :password
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,  :presence => true,
                      :format => {:with => email_regex},
                      :uniqueness => {:case_sensitive => false }
  validates :password,  :presence => true,
                        :length => {:within => 6..40},
                        :confirmation => true
end

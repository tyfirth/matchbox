class User < ActiveRecord::Base

  validates_presence_of :name, :email, :password
  validates :name, :email, uniqueness: true

end

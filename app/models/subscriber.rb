class Subscriber < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email
  validates :email, email: true
end

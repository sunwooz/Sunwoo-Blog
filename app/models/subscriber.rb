class Subscriber < ActiveRecord::Base
  validates_presence_of :email
  validates :email, email: true
end

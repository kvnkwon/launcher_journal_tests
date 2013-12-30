class User < ActiveRecord::Base
  has_many :entries, inverse_of: :user
  validates_presence_of :first_name
  validates_presence_of :last_name
end

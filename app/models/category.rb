class Category < ActiveRecord::Base
  has_many :entries, inverse_of: :category
  validates_presence_of :name
  validates_uniqueness_of :name
end

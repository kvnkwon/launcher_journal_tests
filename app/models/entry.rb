class Entry < ActiveRecord::Base
  belongs_to :user, inverse_of: :entries
  belongs_to :category, inverse_of: :entries
  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :description
end

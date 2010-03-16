class Game < ActiveRecord::Base
  validates_presence_of :name
  has_many :accounts
  has_many :buildings, :order => 'income ASC'
  
  accepts_nested_attributes_for :buildings
end

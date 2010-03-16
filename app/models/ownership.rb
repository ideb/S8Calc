class Ownership < ActiveRecord::Base
  validates_presence_of :building_id
  validates_presence_of :user_id
  validates_presence_of :count, :default => "0"
  belongs_to :building
  belongs_to :user
end

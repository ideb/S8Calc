class Building < ActiveRecord::Base
  has_many :ownerships
  has_many :users, :through => :ownerships
  belongs_to :game
  accepts_nested_attributes_for :ownerships
  
  def roi
      write_attribute(:roi, income.to_f / cost )
  end
      
  def new_owner(user, building)
    Ownership.create(:user => user, :building => building, :count => "0")
  end
end

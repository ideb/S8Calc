class User < ActiveRecord::Base
  acts_as_authorization_subject
  acts_as_authentic do |c|
    #c.my_config_option = my_value  #for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional
  has_many :accounts
  has_many :ownerships
  has_many :buildings, :through => :ownerships
end
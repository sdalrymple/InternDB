class User < ActiveRecord::Base

  attr_accessible :class_year, :email, :major, :name, :user_role
  has_many :authorizations
  validates :email, :presence => true

  def add_provider(auth_hash)
  	# Check if the provider already exists, so we don't add it twice
  	unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    	Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  	end
  end
  def is_admin?()
  	# return self.email =~ /^ccs@colgate.edu$/
  	return self.email =~ /^(ccs|dhercher|sdalrymple|tmajoni|mbrody|jsommers)@colgate.edu$/ 
  end
end

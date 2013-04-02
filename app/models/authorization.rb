class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
  	unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
        if auth_hash["info"]["email"] =~ /.*@colgate.edu/
    		user = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
    		auth = create :user_id => user.id, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    	else
    		auth = false
    	end
  	end
  	auth
  end
end

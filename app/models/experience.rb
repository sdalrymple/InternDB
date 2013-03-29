class Experience < ActiveRecord::Base
  attr_accessible :accepted, :approved, :contact, :extended, :function, :industry, :location, :organization, :paid, :rating, :review, :season, :user_id, :year
end

class Experience < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date, :director
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.same_director director
  	Experience.find_by_director(director)
  end
end

module UsersHelper
	def choose_ordering(sort)
		# debugger
		case sort
	    when 'company'
	      ordering = {:order => :organization}
	    when 'industry'
	      ordering = {:order => :industry}
	    when 'role'
	      ordering = {:order => :function}
	    when 'location'
	      ordering = {:order => 'state, city'}
	    when 'internship_date' 
	      ordering = {:order => 'year desc, season'}
	    when 'review_date'
	      ordering = {:order => 'updated_at desc'}
	    when 'repeat'
	      ordering = {:order => 'repeat desc'}
	    when 'composite'
	      ordering = {:order => 'composite desc'}
	    when 'hands_on_rating'
	      ordering = {:order => 'hands_on_rating desc'}
	    when 'network_rating'
	      ordering = {:order => 'network_rating desc'}
	    when 'exposure_rating'
	      ordering = {:order => 'exposure_rating desc'}
	    end
	    return ordering
	end
end

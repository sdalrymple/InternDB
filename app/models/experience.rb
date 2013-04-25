class Experience < ActiveRecord::Base

  attr_accessible :accepted, :approved, :contact, :extended, :function, :industry, :location, :organization, :paid, :rating, :review, :season, :user_id, :year, :denied, :city, :state, :country, :hands_on_review, :hands_on_rating, :network_review, :network_rating, :exposure_review, :exposure_rating, :contact_relation, :repeat, :comments, :composite

  def get_name
    User.find(self.user_id).name
  end
  
  def repeat?
    if self.repeat
      "Yes"
    else
      "No"
    end
  end


  def date_str
    self.season + " " + (self.year).to_s
  end

  def citystate
    self.city + "," + self.state
  end

  def paid_str
    if self.paid
      "Paid"
    else
      "Unpaid"
    end
  end
  
  def result
    if self.extended
      if self.accepted
        "Accepted Offer"
      else
        "Declined Offer"
      end
    else
      "No Offer"
    end
  end

end

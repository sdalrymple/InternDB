class Experience < ActiveRecord::Base

  attr_accessible :accepted, :approved, :contact, :extended, :function, :industry, :location, :organization, :paid, :rating, :review, :season, :user_id, :year

  def date_str
    self.season + " " + (self.year).to_s
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

#spec/models/experience_spec.rb:

require 'spec_helper'

describe Experience do
  fixtures :experiences
  it 'should find the name of the user who posted the experience' do
    gs = experiences(:goldman_experience)
    gs.get_name.should == "Joe Schmoe"
  end

  it 'should return the date in tring form' do
    gs = experiences(:goldman_experience)
    nbc = experiences(:NBC_experience)
    gs.date_str.should == "summer 2011"
    nbc.date_str.should == "winter 2010"
  end
    



  it 'should return the correct paid string' do
    gs = experiences(:goldman_experience)
    gate = experiences(:colgate_experience)
    nbc = experiences(:NBC_experience)
    gs.result.should == 'Accepted Offer'
    gate.result.should == "No Offer"
    nbc.result.should == "Declined Offer"
  end

  it 'should return the whether an offer was extended and accpted' do
    gs = experiences(:goldman_experience)
    nbc = experiences(:NBC_experience)
    gs.paid_str.should == "Paid"
    nbc.paid_str.should == "Unpaid"
  end
end

#spec/models/experience_spec.rb:

require 'spec_helper'

describe Experience do
  fixtures :experiences
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

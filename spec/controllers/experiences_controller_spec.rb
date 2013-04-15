require "spec_helper"



describe ExperiencesController do
     it "should be able to create a new experience" do 
       expect {
post :create, experience: { :organization => "Colgate", :location => "New York", :function => "Marketing", :industry => "Insurance", :paid => "yes", :review => "Best internship ever"}
       }.to change(Experience, :count).by(1)
    end
end

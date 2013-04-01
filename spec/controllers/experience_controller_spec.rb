require "spec_helper"



describe ExperiencesController do
     it "should be able to create a new experience and redirect to experience_path" do
		post :create, { :organization => "Colgate", :location => "New York", :function => "Marketing", :industry => "Insurance", :paid => "yes", :review => "Best internship ever"}
                response.should redirect_to(experiences_path)
		flash[:notice].should_not be_blank
     end
end

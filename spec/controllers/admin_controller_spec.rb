require "spec_helper"


describe AdminController do
  fixtures :experiences, :users
  it "assigns the requested experience to @experience" do
    experience = experiences(:goldman_experience)
    get :show, id: experience
    assigns(:experience).should eq(experience)    
  end
end




Given /^that I am logged in$/ do
  visit '/?user_id=2'
  logged = true  
end

Given /^that I am not logged in$/ do
  visit '/'
  logged = false  
end

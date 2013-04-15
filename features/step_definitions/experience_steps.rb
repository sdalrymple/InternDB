
Given /^that I am logged in$/ do
  logged = true
end

Given /^that I am not logged in$/ do
  logged = false  
end

When /^I try to visit the homepage$/ do
  logged = true
  visit '/'
end


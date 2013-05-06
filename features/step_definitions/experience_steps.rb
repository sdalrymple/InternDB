
require_relative '../../spec/spec_helper.rb'


Given /^that I am logged in$/ do
  logged = true
  page.set_rack_session(:user_id => 2)
end

Given /^that I am logged in as an admin$/ do
  logged = true
  page.set_rack_session(:user_id => 5)
end

Given /^that I am not logged in$/ do
  logged = false  
end

Given /the following experiences exist/ do |experience_table|
  experience_table.hashes.each do |exp|
    Experience.create!(exp)
  end
end

Then /^I should see all the approved Google experiences$/ do
  googs = page.all('table#experiences tr').count - 1
  googs.should == 2
end



When /^I try to visit the homepage$/ do
  logged = true
  visit '/'
end




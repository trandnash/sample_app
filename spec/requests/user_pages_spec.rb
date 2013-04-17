require 'spec_helper'

describe "UserPages" do

  describe "Signup page" do
  
    it "should have the h1 'Sign up'" do
      visit signup_path
      page.should have_selector('h1', text: 'Sign up')
    end

    it "should have the base title" do
      visit signup_path
      page.should have_selector('title',
                      text: "Ruby on Rails Tutorial Sample App")
    end

    #it "should not have a custom page title" do
      #visit signup_path
      #page.should_not have_selector('title', text: '| Sign up')
    #end 
  end
end

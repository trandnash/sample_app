require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
  
    it "should have the h1 'The Fuelist'" do
      visit root_path
      page.should have_selector('h1', text: 'Fuelist')
    end

    it "should have the base title" do
      visit root_path
      page.should have_selector('title',
                      text: "Ruby on Rails")
    end

    it "should not have a custom page title" do
      visit root_path
      page.should_not have_selector('title', text: '| Home')
    end 

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do
  
    it "should have the h1 'Help'" do
      visit help_path
      page.should have_selector('h1', text: 'Help')
    end

    it "should have the base title" do
      visit help_path
      page.should have_selector('title',
                      text: "Ruby on Rails")
    end

    it "should not have a custom page title" do
      visit help_path
      page.should_not have_selector('title', text: '| Help')
    end 
  end

  describe "About page" do
  
    it "should have the h1 'About Us'" do
      visit about_path
      page.should have_selector('h1', text: 'About')
    end

    it "should have the base title" do
      visit about_path
      page.should have_selector('title',
                      text: "Ruby on Rails")
    end

    it "should not have a custom page title" do
      visit about_path
      page.should_not have_selector('title', text: '| About')
    end 
  end

  describe "Contact page" do
  
    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the base title" do
      visit contact_path
      page.should have_selector('title',
                      text: "Ruby on Rails")
    end

    it "should not have a custom page title" do
      visit contact_path
      page.should_not have_selector('title', text: '| Contact')
    end 
  end
end





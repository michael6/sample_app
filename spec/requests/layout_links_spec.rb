require 'spec_helper'

#describe "LayoutLinks" do
#  describe "GET /layout_links" do
#    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get layout_links_index_path
#      response.status.should be(200)
#    end
#  end
#end

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
<<<<<<< HEAD
  it "should have the right links on the layout" do
=======
  #------------------------
  
    it "should have the right links on the layout" do
>>>>>>> shaofenchen/exercise5.2
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Help"
<<<<<<< HEAD
    response.should have_selector('title', :content => "Help")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end
  
=======
    response.should have_selector('title', :content => "Help")# fill in
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")# fill in
    click_link "Home"
    response.should have_selector('title', :content => "Home")# fill in
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")# fill in
  end
  
  
>>>>>>> shaofenchen/exercise5.2
end
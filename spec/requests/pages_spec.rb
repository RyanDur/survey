require 'spec_helper'

describe "Pages" do
  subject {page}

  describe "Home page" do
    before {visit '/pages/home'}

    it {should have_content('Survey')}
    it {should have_title("Survey")}
  end

  describe "Help page" do
    before {visit '/pages/help'}

    it {should have_content('Help')}
    it {should have_title("Survey | Help")}
  end

  describe "About page" do
    before {visit '/pages/about'}

    it {should have_content('About')}
    it {should have_title("Survey | About")}
  end
end

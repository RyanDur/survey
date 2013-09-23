require 'spec_helper'

describe "Pages" do
  subject {page}

  describe "Home page" do
    before {visit home_path}

    it {should have_content 'Survey'}
    it {should have_title 'Survey'}
    it {should_not have_title '| Home'}
  end

  describe "Help page" do
    before {visit help_path}

    it {should have_content 'Help'}
    it {should have_title 'Survey | Help'}
  end

  describe "About page" do
    before {visit about_path}

    it {should have_content 'About'}
    it {should have_title 'Survey | About'}
  end

  describe "Contact page" do
    before {visit contact_path}

    it {should have_content 'Contact'}
    it {should have_title 'Survey | Contact'}
  end
end

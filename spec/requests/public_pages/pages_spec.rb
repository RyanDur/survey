require 'spec_helper'

describe "Pages" do
  subject {page}
  let(:help) {'Help'}
  let(:about) {'About'}
  let(:contact) {'Contact'}

  it "should have the right links on the layout" do
    visit root_path
    click_link about
    should have_title full_title(about)
    click_link help
    should have_title full_title(help)
    click_link contact
    should have_title full_title(contact)
    click_link "Home"
    click_link "Sign up now!"
    should have_title full_title('Sign up')
    click_link "survey"
    should have_title 'Survey'
  end
end

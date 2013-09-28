require 'spec_helper'

describe "edit" do
  subject {page}
  let(:user) {FactoryGirl.create(:user)}
  before do
    signin user
    visit edit_user_path(user)
  end

  describe "page" do
    let(:heading) {"Update your profile"}
    let(:page_title) {"Edit user"}

    it_should_behave_like :all_pages
    it {should have_link 'change', href: 'http://gravatar.com/emails'}
  end

  describe "with invalid information" do
    before {click_button "Save changes"}

    it {should have_css '.help-inline'}
  end

  describe "with valid information" do
    let(:new_name)  {"New Name"}
    let(:new_email) {"new@example.com"}
    before do
      fill_in "Name", with: new_name
      fill_in "Email", with: new_email
      fill_in "Password", with: user.password
      fill_in "Confirm Password", with: user.password
      click_button "Save changes"
      click_on 'Account'
    end

    it {should have_title new_name}
    it {should have_selector 'div.alert.alert-success'}
    it {should have_link 'Sign out', href: signout_path}
    specify {expect(user.reload.name).to eq new_name}
    specify {expect(user.reload.email).to eq new_email}
  end
end

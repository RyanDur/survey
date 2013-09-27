require 'spec_helper'

describe "signin page" do
  subject {page}
  before {visit signin_path}
  let(:sign_in) {'Sign in'}

  let(:heading) {sign_in}
  let(:page_title) {sign_in}
  it_should_behave_like :all_pages

  describe "signin" do
    describe "with invalid information" do
      before {click_button sign_in}
      it {should flash_message 'error', 'Invalid'}

      describe "after visiting another page" do
        before {click_link "Home"}
        it {should_not flash_message('error', 'Invalid')}
      end
    end
  end

  describe "with valid information" do
    let(:user) {FactoryGirl.create :user}
    before do
      signin user
      click_on 'Account'
    end

    it {should have_title user.name}
    it {should have_link 'Profile', href: user_path(user)}
    it {should have_link 'Sign out', href: signout_path}
    it {should_not have_link sign_in, href: signin_path}

    describe "followed by signout" do
      before {click_link "Sign out"}
      it {should have_link sign_in}
    end
  end
end

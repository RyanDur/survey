require 'spec_helper'

describe "signup page" do
  subject {page}
  let(:sign_up) {'Sign up'}
  let(:heading) {sign_up}
  let(:page_title) {sign_up}
  let(:submit) {"Create my account"}

  before {visit signup_path}
  it_should_behave_like :all_pages

  describe "with invalid information" do
    it "should not create a user" do
      expect {click_button submit}.not_to change(User, :count)
    end

    describe "after submission" do
      before {click_button submit}
      it {should have_content 'error'}
    end
  end

  describe "with valid information" do
    before do
      fill_in "Name",         with: "Example User"
      fill_in "Email",        with: "user@example.com"
      fill_in "Password",     with: "foobar"
      fill_in "Confirmation", with: "foobar"
    end

    it "should create a user" do
      expect {click_button submit}.to change(User, :count).by(1)
    end

    describe "after saving the user" do
      let(:user) {User.find_by email: 'user@example.com'}
      before do
        click_button submit
        click_on 'Account'
      end

      let(:heading) {user.name}
      let(:page_title) {user.name}
      it_should_behave_like :all_pages

      it {should have_link 'Sign out'}
      it {should flash_message('success', 'Welcome')}
    end
  end
end

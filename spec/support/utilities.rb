include ApplicationHelper

def signin(user, options = {})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end

RSpec::Matchers.define :flash_message do |type, message|
  match do |page|
    expect(page).to have_selector("div.alert.alert-#{type}", text: message)
  end
end


shared_examples_for :all_pages do
  it {should have_selector 'h1', text: heading}
  it {should have_title full_title(page_title)}
end

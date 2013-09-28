require 'spec_helper'

describe "index" do
  subject {page}

  let(:user) { FactoryGirl.create(:user)  }
  before(:each) do
    signin user
    visit users_path
  end

  let(:heading) {"All users"}
  let(:page_title) {"All users"}
  it_should_behave_like :all_pages

  describe "pagination" do

    before(:all) {30.times {FactoryGirl.create(:user)}}
    after(:all)  {User.delete_all}

    it {should have_selector 'div.pagination'}

    it "should list each user" do
      User.paginate(page: 1).each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end

  describe "delete links" do

    it {should_not have_link 'delete'}

    describe "as an admin user" do
      let(:admin) {FactoryGirl.create(:admin)}
      before do
        signin admin
        visit users_path
      end

      it {should have_link 'delete', href: user_path(User.first)}

      it "should be able to delete another user" do
        user_count = User.count
        first_user = find('.users').first('li').text

        first(:link, 'delete').click
        page.driver.browser.switch_to.alert.accept

        find('.users').first('li').text.should_not eq first_user
        expect(User.count).to eq user_count - 1
      end

      it {should_not have_link 'delete', href: user_path(admin)}
    end
  end
end

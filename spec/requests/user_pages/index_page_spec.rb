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
end

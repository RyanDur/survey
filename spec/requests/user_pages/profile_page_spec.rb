require 'spec_helper'

describe "profile page" do
  subject {page}

  let(:user) {FactoryGirl.create(:user)}
  before {visit user_path user}

  let(:heading) {user.name}
  let(:page_title) {user.name}

  it_should_behave_like :all_pages
end

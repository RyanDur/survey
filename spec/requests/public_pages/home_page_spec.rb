require 'spec_helper'

describe "Home page" do
  subject {page}

  before {visit root_path}

  let(:heading) {'Survey'}
  let(:page_title) {''}

  it_should_behave_like :all_pages
  it {should_not have_title full_title('Home')}
end

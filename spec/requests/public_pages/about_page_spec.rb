require 'spec_helper'

describe "About page" do
  subject {page}
  let(:about) {'About'}
  before {visit about_path}

  let(:heading) {about}
  let(:page_title) {about}

  it_should_behave_like :all_pages
end

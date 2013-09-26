require 'spec_helper'

describe "Contact page" do
  subject {page}
  let(:contact) {'Contact'}
  before {visit contact_path}

  let(:heading) {contact}
  let(:page_title) {contact}

  it_should_behave_like :all_pages
end

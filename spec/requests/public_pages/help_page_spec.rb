require 'spec_helper'

describe "Help page" do
  subject {page}

  let(:help) {'Help'}
  let(:heading) {help}
  let(:page_title) {help}

  before {visit help_path}

  it_should_behave_like :all_pages
end

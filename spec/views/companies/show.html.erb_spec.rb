require 'rails_helper'

RSpec.describe "companies/show", :type => :view do
  before(:each) do
    @company = assign(:company, create(:company))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

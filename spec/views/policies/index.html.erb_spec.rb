require 'rails_helper'

RSpec.describe "policies/index", :type => :view do
  before(:each) do
    assign(:policies, [
      Policy.create!(
        :name => "Name1",
        :company => Company.first
      ),
      Policy.create!(
        :name => "Name2",
        :company => Company.first
      )
    ])
  end

  it "renders a list of policies" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1

  end
end

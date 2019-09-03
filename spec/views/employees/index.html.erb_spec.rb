require 'rails_helper'

RSpec.describe "employees/index", :type => :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name",
        :email => "Email@gmail.com",
        :phone => "Phone",
        :company_id => 1
      ),
      Employee.create!(
        :name => "Name",
        :email => "Email2@gmail.com",
        :phone => "Phone",
        :company_id => 1
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end

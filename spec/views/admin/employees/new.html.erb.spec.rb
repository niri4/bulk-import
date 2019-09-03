require 'rails_helper'

RSpec.describe "admin/employees/new", :type => :view do
  before(:each) do
    assign(:companies, create_list(:company, 2))
    sign_in Admin.first
  end

  it "renders bulk import form" do
    render

    assert_select "form[action=?][method=?]", admin_employees_path, "post" do

      assert_select 'select', name: 'bulk_import[:company]', required: 'required'
      assert_select 'input', name: "bulk_import[file]", type: 'file', required: 'required'
    end
  end
end

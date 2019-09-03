require "rails_helper"

RSpec.describe Admin::EmployeesController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "admin/employees/new").to route_to("admin/employees#new")
    end

    it "routes to #create" do
      expect(:post => "admin/employees").to route_to("admin/employees#create")
    end

  end
end

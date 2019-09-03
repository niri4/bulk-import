require 'rails_helper'

RSpec.describe "Employees", :type => :request do
  describe "GET /employees" do
    it "show list of employees" do
      get employees_path
      expect(response).to render_template(:index)
      expect(response.status).to be(200)
    end
  end
end

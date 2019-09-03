require 'rails_helper'

RSpec.describe "Companies", :type => :request do
  describe "GET /companies" do
    it "show list of companies" do
      get companies_path
      expect(response).to render_template(:index)
      expect(response.status).to be(200)
    end
  end
end

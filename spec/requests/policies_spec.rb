require 'rails_helper'

RSpec.describe "Policies", :type => :request do
  describe "GET /policies" do
    it "show list of policies" do
      get policies_path
      expect(response).to render_template(:index)
      expect(response.status).to be(200)
    end
  end
end

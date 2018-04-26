require 'rails_helper'

RSpec.describe "SimpleLogs", type: :request do
  describe "GET /simple_logs" do
    it "works! (now write some real specs)" do
      get simple_logs_path
      expect(response).to have_http_status(200)
    end
  end
end

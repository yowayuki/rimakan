require "rails_helper"

RSpec.describe "Api::V1::HealthCheck", type: :request do
  describe "GET api/v1/health_check" do
    it "正常にレスポンスが返る" do
      get "/api/v1/health_check"
      res = response.parsed_body
      expect(res["message"]).to eq "Success Health Check!"
      expect(response).to have_http_status(:success)
    end
  end
end

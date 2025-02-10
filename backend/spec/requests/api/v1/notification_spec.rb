require "rails_helper"

RSpec.describe "Api::V1::Notifications", type: :request do
  describe "POST api/v1/notification" do
    subject { post(api_v1_notification_index_path, params:) }

    let(:params) { { notification: { web_hook_url: "https://chat.googleapis.com/v1/spaces/AAAA_testURL_A" } } }

    context "未登録のwebhookURLの場合" do
      it "新規通知先idが登録される" do
        expect { subject }.to change { Notification.count }.by(1)
        res = response.parsed_body
        expect(res.keys).to eq ["id"]
        expect(response).to have_http_status(:ok)
      end
    end

    context "登録済みのwebhookURLの場合" do
      it "登録済みの通知先idが返却される" do
        create(:notification, web_hook_url: "https://chat.googleapis.com/v1/spaces/AAAA_testURL_A")
        expect { subject }.not_to change { Notification.count }
        res = response.parsed_body
        expect(res.keys).to eq ["id"]
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

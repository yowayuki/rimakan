require "rails_helper"

RSpec.describe Notification, type: :model do
  describe "正常系" do
    context "factoryのデフォルト設定に従った場合" do
      subject { create(:notification) }

      it "notificationレコードに新規insertできる" do
        expect { subject }.to change { Notification.count }.by(1)
      end
    end
  end

  describe "validation" do
    subject { notification.valid? }

    let(:notification) { build(:notification, web_hook_url:) }
    let(:web_hook_url) { "https://chat.googleapis.com/v1/spaces/AAAA_testURL_validation" }

    context "factoryのデフォルト設定に従った場合" do
      it "検証が通る" do
        expect(subject).to be_truthy
      end
    end

    context "webhookURLが無い場合" do
      let(:web_hook_url) { "" }

      it "エラーメッセージが返却される" do
        expect(subject).to be_falsy
        expect(notification.errors[:web_hook_url]).to include("can't be blank")
      end
    end

    context "webhookURLの形式が不正な場合" do
      let(:web_hook_url) { "https://example.com/" }

      it "エラーメッセージが返却される" do
        expect(subject).to be_falsy
        expect(notification.errors[:web_hook_url]).to include("is invalid")
      end
    end

    context "webhookURLが重複する場合" do
      it "エラーメッセージが返却される" do
        create(:notification, web_hook_url: notification.web_hook_url)
        expect(subject).to be_falsy
        expect(notification.errors[:web_hook_url]).to include("has already been taken")
      end
    end
  end
end

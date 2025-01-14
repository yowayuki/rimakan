FactoryBot.define do
  factory :notification do
    sequence(:web_hook_url) {|n| "https://chat.googleapis.com/v1/spaces/AAAA_testURL_#{n}" }
  end
end

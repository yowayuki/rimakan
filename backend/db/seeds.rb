ActiveRecord::Base.transaction do
  Notification.create!(web_hook_url: "https://chat.googleapis.com/v1/spaces/AAAA_testURL_1")
  Notification.create!(web_hook_url: "https://chat.googleapis.com/v1/spaces/AAAA_testURL_2")
end

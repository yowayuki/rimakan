class Notification < ApplicationRecord
  VALID_WEB_HOOK_URL_REGEX = %r{\Ahttps://chat.googleapis.com/v1/spaces/AAAA}
  validates :web_hook_url, presence: true, uniqueness: true, format: { with: VALID_WEB_HOOK_URL_REGEX }
end

class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.string :web_hook_url, null: false, comment: "Webhook URL"

      t.timestamps
    end
    add_index :notifications, :web_hook_url, unique: true
  end
end

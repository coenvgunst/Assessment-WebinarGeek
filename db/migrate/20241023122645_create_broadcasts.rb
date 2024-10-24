class CreateBroadcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :broadcasts do |t|
      t.string :title
      t.datetime :broadcast_date
      t.integer :subscriptions_count

      t.timestamps
    end
  end
end

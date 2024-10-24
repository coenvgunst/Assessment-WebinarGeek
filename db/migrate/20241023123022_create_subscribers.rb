class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.boolean :watched
      t.string :email
      t.string :firstname
      t.string :surname
      t.string :registration_ip
      t.references :broadcast, null: false, foreign_key: true

      t.timestamps
    end
  end
end

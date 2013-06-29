class CreateEventMessages < ActiveRecord::Migration
  def up
    create_table :event_messages do |t|
      t.string :event
      t.string :event_key

      t.timestamps
    end
  end

  def down
    drop_table :event_messages
  end
end

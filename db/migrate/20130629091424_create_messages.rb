class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.integer :msg_id, :limit => 8
      t.string :from
      t.string :msg_type
      t.integer :receive_time, :limit => 8
      t.integer :details, :limit => 8

      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end

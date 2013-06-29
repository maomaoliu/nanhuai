class CreateTextMessages < ActiveRecord::Migration
  def up
    create_table(:text_messages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=gbk') do |t|
      t.string :text

      t.timestamps
    end
  end

  def down
    drop_table :text_messages
  end
end

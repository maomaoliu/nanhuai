class CreateLinkMessages < ActiveRecord::Migration
  def up
    create_table(:link_messages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=gbk') do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :link_messages
  end
end

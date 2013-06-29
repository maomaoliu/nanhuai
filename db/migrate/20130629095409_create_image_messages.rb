class CreateImageMessages < ActiveRecord::Migration
  def up
    create_table(:image_messages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=gbk') do |t|
      t.string :link

      t.timestamps
    end
  end

  def down
    drop_table :image_messages
  end
end

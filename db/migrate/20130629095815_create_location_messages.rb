class CreateLocationMessages < ActiveRecord::Migration
  def up
    create_table(:location_messages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=gbk') do |t|
      t.float :x
      t.float :y
      t.integer :scale
      t.string :label

      t.timestamps
    end
  end

  def down
    drop_table :location_messages
  end
end

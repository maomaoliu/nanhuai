class CreateNovoEntries < ActiveRecord::Migration
  def up
    create_table(:novo_entries, :options => 'ENGINE=InnoDB DEFAULT CHARSET=gbk') do |t|
      t.string :k
      t.string :v, :limit => 1024

      t.timestamps
    end

    add_index(:novo_entries, :k, unique: true, where: "active")
  end

  def down
    remove_index(:novo_entries, column: :k)
    drop_table :novo_entries
  end
end

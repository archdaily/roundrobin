class CreateRoundrobin < ActiveRecord::Migration
  def change
    create_table :roundrobin do |t|
      t.string :identifier
      t.integer :iterator
      t.timestamps
    end
  end
end

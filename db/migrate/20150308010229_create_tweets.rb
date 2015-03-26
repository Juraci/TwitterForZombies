class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.integer :zombie_id

      t.timestamps
    end
    add_index :tweets, :zombie_id

  end
end

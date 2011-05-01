class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
			t.string :body
			t.datetime :start_in
			t.date :finish_by

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end

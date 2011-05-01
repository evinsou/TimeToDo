class CreateDurations < ActiveRecord::Migration
  def self.up
    create_table :durations do |t|
      t.string :time_limit

      t.timestamps
    end
  end

  def self.down
    drop_table :durations
  end
end

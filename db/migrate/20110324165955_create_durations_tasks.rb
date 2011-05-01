class CreateDurationsTasks < ActiveRecord::Migration
  def self.up
      create_table :durations_tasks, :id => false do |t|
         t.references :duration
         t.references :task
      end
  end

  def self.down
      drop_table :durations_tasks
  end
end

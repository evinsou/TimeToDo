class CreateAgileLabors < ActiveRecord::Migration
  def self.up
    create_table :agile_labors do |t|
      t.string   :body
      t.string   :labor_type
      t.string   :exec_order
      t.datetime :start_in

      t.timestamps
    end
  end

  def self.down
    drop_table :agile_labors
  end
end

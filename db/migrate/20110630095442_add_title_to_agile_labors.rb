class AddTitleToAgileLabors < ActiveRecord::Migration
  def self.up
    add_column :agile_labors, :title, :string
  end

  def self.down
    remove_column :agile_labors, :title
  end
end

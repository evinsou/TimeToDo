class ChangeBodyTypeToTextInAgileLabors < ActiveRecord::Migration
  def self.up
    change_column :agile_labors, :body, :text
  end

  def self.down
    change_column :agile_labors, :body, :string 
  end
end

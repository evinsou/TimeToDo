class AddUserIdToAgileLabours < ActiveRecord::Migration
  def change
    add_column :agile_labors, :user_id, :integer
  end
end


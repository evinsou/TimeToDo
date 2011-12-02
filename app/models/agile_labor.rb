class AgileLabor < ActiveRecord::Base
  validates :title, :body, :labor_type, :exec_order, :presence => true
end

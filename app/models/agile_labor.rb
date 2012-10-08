class AgileLabor < ActiveRecord::Base
  validates :title, :body, :labor_type, :exec_order, :presence => true

  scope :current_labors, where(:exec_order => 'Current')
#  scope :backlogged, where("labor_type LIKE ?","Backlog") :conditions => { :published => true }
  scope :backlogged, where( :exec_order => "Backlog" )
  scope :iceboxed, where("exec_order = ?", "Icebox")

  #default_scope order('categories.name')


end


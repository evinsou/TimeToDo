class Task < ActiveRecord::Base
  acts_as_list
	validates :body, :presence => true,
                   :length => {:within => 4..140}

	belongs_to :user
  has_and_belongs_to_many :durations
  has_and_belongs_to_many :categories

  scope :tasks_own_by, lambda {|user| where('user_id=?', user.id)}

	def time_for_execute
	  "Time for execute #{(finish_by.to_date - start_in.to_date).to_s.split('/')[0]}"
	end

	def time_left
	  "Time left #{(finish_by.to_date - Time.now.to_date).to_s.split('/')[0]}"
	end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end


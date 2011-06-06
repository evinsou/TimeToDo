class Task < ActiveRecord::Base

	validates :body, :presence => true,
                   :length => {:within => 4..60} 

	belongs_to :user
  has_and_belongs_to_many :durations
  has_and_belongs_to_many :categories

	def time_for_execute
			"Time for execute #{finish_by.to_date} - #{start_in.to_date}"
	end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

end

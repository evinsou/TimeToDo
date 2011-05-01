class Task < ActiveRecord::Base
		validates :body, :presence => true

	belongs_to :user
  has_and_belongs_to_many :durations

	def time_for_execute
			"Time for execute #{finish_by} - #{start_in}"
	end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

end

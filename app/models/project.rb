class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :targets, presence: true

  has_many :tasks
  belongs_to :user
end

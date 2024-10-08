class Job < ApplicationRecord
  validates :url, presence: true
end

class Worker < ApplicationRecord
  belongs_to :user
  belongs_to :document
end

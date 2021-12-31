class Document < ApplicationRecord
  has_many :workers
  belongs_to :document_type
  belongs_to :procedure
  validates :name, presence: true
  validates :workflow_state, presence: true
  validates :date, presence: true
  validates :category, presence: true   

end

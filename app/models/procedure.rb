class Procedure < ApplicationRecord
    has_many :documents
    validates :name, presence: true, uniqueness: true
    validates :code, presence: true, uniqueness: true
end

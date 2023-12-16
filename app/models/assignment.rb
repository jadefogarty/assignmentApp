# frozen_string_literal: true

# Application Record
class Assignment < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :module, presence: true
  validates :lecturer, presence: true
  validates :due_date, presence: true
  validates :weighting, presence: true
  validates :status, presence: true
  # validates :submitted, presence: true
end

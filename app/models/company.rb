class Company < ApplicationRecord
  has_many :employees
  has_many :policies
  has_many_attached :csv_uploads

  validates :name, presence: true
end

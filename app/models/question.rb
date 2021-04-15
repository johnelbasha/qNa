class Question < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 4}
  validates :body, presence: true
  validates :body, length: { minimum: 10}
  belongs_to :user

end

class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  validates_presence_of :title, :day, :room

  def day_of_surgery
    same_day = Surgery.where(day: day).pluck(:title)
    same_day.delete(self.title)
    same_day
  end
end

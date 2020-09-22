class SurgeryDoctor < ApplicationRecord
  belongs_to :surgery
  belongs_to :doctor
end

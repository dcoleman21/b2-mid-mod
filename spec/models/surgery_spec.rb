require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many :surgery_doctors}
    it { should have_many(:doctors).through(:surgery_doctors)}
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :room }
  end

  describe 'instance methods' do
    it "can get same day surgeries" do
      hosp1 = Hospital.create!(name:"Grey Sloan Memorial Hospital")
      doc1  = hosp1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doc2  = hosp1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      surg1 = doc1.surgeries.create!(title: "Knee", day: "Monday", room:"1")
      surg3 = doc2.surgeries.create!(title: "Shoulder", day: "Monday", room:"3")

      expected = ["Shoulder"]

      expect(surg1.day_of_surgery).to eq(expected)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Surgerys Index page' do
  before :each do
    @hosp1 = Hospital.create!(name:"Grey Sloan Memorial Hospital")
    @hosp2 = Hospital.create!(name:"Seaside Health & Wellness Center")

    @doc1 = @hosp1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doc2 = @hosp1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doc3 = @hosp2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc4 = @hosp2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    @surg1 = @doc1.surgeries.create!(title: "Knee", day: "Monday", room:"1")
    @surg2 = @doc1.surgeries.create!(title: "Elbow", day: "Tuesday", room:"2")
    @surg3 = @doc2.surgeries.create!(title: "Shoulder", day: "Monday", room:"3")
    @surg4 = @doc3.surgeries.create!(title: "Wrist", day: "Wednesday", room:"4")

    @surgeries = Surgery.all
    visit '/surgeries'
  end
  it "I see the title of all surgeries." do
    @surgeries.each do |surgery|
      expect(page).to have_content(surgery.title)
    end
  end
  it "for each surgery I see the names of all doctors performing that surgery" do
    @surg1.doctors.each do |doctor|
      expect(page).to have_content(doctor.name)
    end

    @surg2.doctors.each do |doctor|
      expect(page).to have_content(doctor.name)
    end

    @surg3.doctors.each do |doctor|
      expect(page).to have_content(doctor.name)
    end

    @surg4.doctors.each do |doctor|
      expect(page).to have_content(doctor.name)
    end
  end
end




# User Story 1, Surgery Index
# As a visitor
# When I visit a surgery’s index page (‘/surgeries’)
# I see the title of all surgeries
# And for each surgery I see the names of all doctors performing that surgery

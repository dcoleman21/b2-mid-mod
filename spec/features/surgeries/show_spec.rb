require 'rails_helper'

RSpec.describe 'Surgerys show page' do
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

    visit "/surgeries/#{@surg1.id}"
  end

  it "I see the title and operating room number of that surgery" do
    expect(page).to have_content(@surg1.title)
    expect(page).to have_content(@surg1.room)
  end

  it "I see a section of the page that says Other surgeries happening this day of the week:" do
    expect(page).to have_content("Other surgeries happening this day of the week:")
  end

  it "And under that header I see titles of all surgeries that happen on the same day of the week as this surgery." do
    @surg1.day_of_surgery.each do |title|
      expect(page).to have_content(title)
    end
  end

  it "I see a field with instructions to Add A Doctor To This Surgery" do
    expect(page).to have_field(:name)

    fill_in :name, with: @doc2.name
    expect(page).to have_button("Submit")
    
    click_on "Submit"
    expect(current_path).to eq("/surgeries/#{@surg1.id}")

    expect(page).to have_content(@doc2.name)
  end
end

# User Story 3, Add a Doctor to a Surgery
# As a visitor
# When I visit a surgery's show page
# I see a field with instructions to "Add A Doctor To This Surgery"
# When I input the name of a Doctor into that field
# And I click submit
# I'm taken back to that surgery's show page
# And I see the name of that doctor listed on the page
# (Note: you do not need to handle any sad paths)

require "rails_helper"

RSpec.feature "creating a new question" do
  scenario "user provies all necessary inputs" do
    visit "/"
    click_link "New Question"
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: 'Why is the sky blue?'
    fill_in "Body", with: 'I really want to know and there are so many different theories'
    click_button "Create Question"
    expect(page).to have_content("Question has been created")
    expect(current_path).to eq(questions_path)
  end
end
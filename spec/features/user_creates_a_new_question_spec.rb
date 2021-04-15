require "rails_helper"

def user_Sign_Up
  click_link "Sign up"
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "123456789"
  fill_in "Password confirmation", with: "123456789"
  click_button "Sign up"
end

RSpec.feature "creating a new question" do
  scenario "user provides all necessary inputs" do
    visit "/"
    click_link "New Question"
    user_Sign_Up
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: 'Why is the sky blue?'
    fill_in "Body", with: 'I really want to know and there are so many different theories'
    click_button "Create Question"
    expect(page).to have_content("Question has been created")
    expect(current_path).to eq(questions_path)
  end

  scenario "user forgets question title" do
    visit "/"
    click_link "New Question"
    user_Sign_Up
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: ''
    fill_in "Body", with: 'I have intentionally forgotten the title of the question'
    click_button "Create Question"
    expect(page).to have_content("Question has not been created!")
    expect(page.current_path).to eq(new_question_path)
  end

  scenario "user forgets question body" do
    visit "/"
    click_link "New Question"
    user_Sign_Up
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: 'Bodyless question'
    fill_in "Body", with: ''
    click_button "Create Question"
    expect(page).to have_content("Question has not been created!")
    expect(page.current_path).to eq(new_question_path)
  end

  scenario "Title is less than 4 characters" do
    visit "/"
    click_link "New Question"
    user_Sign_Up
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: '123'
    fill_in "Body", with: 'Hey. My title only has three characters. Is this allowed?'
    click_button "Create Question"
    expect(page).to have_content("Question has not been created!")
    expect(page.current_path).to eq(new_question_path)
  end

  scenario "Body is less than 10 characters" do
    visit "/"
    click_link "New Question"
    user_Sign_Up
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: 'Reasonable Title for A Question'
    fill_in "Body", with: '123456789'
    click_button "Create Question"
    expect(page).to have_content("Question has not been created!")
    expect(page.current_path).to eq(new_question_path)
  end


end
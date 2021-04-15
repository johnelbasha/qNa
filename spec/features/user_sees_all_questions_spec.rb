require "rails_helper"

def user_Sign_Up
  click_link "Sign up"
  fill_in "Email", with: "user@example.com"
  fill_in "Username", with: "UsherPenguin"
  fill_in "user[password]", with: "123456789"
  fill_in "user[password_confirmation]", with: "123456789"
  click_button "Sign up"
end

RSpec.feature "Viewing all questions" do

  scenario 'A user navigates to homepage to see all the existing questions' do
    visit "/"
    click_link "New Question"
    user_Sign_Up
    expect(page).to have_content("Post a new question")
    fill_in "Title", with: 'Why is the sky blue?'
    fill_in "Body", with: 'I really want to know and there are so many different theories'
    click_button "Create Question"
    expect(page).to have_link "Why is the sky blue?"
    puts page.html
    expect(page).to have_content("UsherPenguin")
  end
end
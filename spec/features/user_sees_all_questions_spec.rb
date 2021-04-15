require "rails_helper"

RSpec.feature "Viewing all questions" do
  before do
    @user = User.create(email: "test@gmail.com", password: "987654321", username: "BoJo")
    @question_one = Question.create(title: "this is the first q", body: "this is the message body", user: @user)
  end

  scenario 'A user navigates to homepage to see all the existing questions' do
    visit "/"
      expect(page).to have_link(@question_one.title)
      expect(page).to have_content(@question_one.user.username)
  end
end
require "rails_helper"

RSpec.feature "Viewing all questions" do
  before do
    @question_one = Question.new(title: "Question Title", body: "this is the message body")
  end

  scenario 'A user navigates to homepage to see all the existing questions' do
    visit "/"
      expect(page).to have_link(@question_one.title) # I can't explain why this isn't working.
  end
end
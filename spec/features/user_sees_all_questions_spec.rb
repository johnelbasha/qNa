require "rails_helper"

RSpec.feature "Viewing all questions" do
  before do
    @question_one = Question.new(title: "this is the first q", body: "this is the message body")
    @question_one.save
  end

  scenario 'A user navigates to homepage to see all the existing questions' do
    visit "/"
      expect(page).to have_link(@question_one.title)
  end
end
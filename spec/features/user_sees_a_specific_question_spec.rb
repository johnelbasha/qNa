require "rails_helper"

RSpec.feature "Seeing a specific question" do
  before do
    @question = Question.new(title: "Major Question", body: "this is the message body")
    @question.save
  end

  scenario "user clicks on link from index page" do
    visit "/"
    click_link @question.title
    expect(page).to have_content(@question.title)
    expect(page).to have_content(@question.body)
    expect(current_path).to eq(question_path(@question))
  end
end
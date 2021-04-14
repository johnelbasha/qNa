require "rails_helper"
RSpec.feature "Visiting homepage" do
  scenario 'A user navigates to localhost:3000' do
    visit "/"
    expect(page).to have_content("Eazy Q&A")
  end
end


require 'spec_helper'

feature 'Home' do

  it 'should show Home' do
    visit(homepage)
    expect(first("h1")).to have_content("Home")
  end

  it 'should not have JavaScript errors', :js => true do
    visit(homepage)
    expect(page).not_to have_errors
  end

end

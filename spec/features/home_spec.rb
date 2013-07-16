require 'spec_helper'

feature 'Home' do

  it 'should show Home#index' do
    visit(homepage)
    expect(page).to have_content("Home#index")
  end

  it 'should not have JavaScript errors', :js => true do
    visit(homepage)
    expect(page).not_to have_errors
  end

end

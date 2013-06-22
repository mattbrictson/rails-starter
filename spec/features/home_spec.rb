require 'spec_helper'

feature 'Home' do

  scenario 'should show Home#index' do
    visit homepage
    expect(page).to have_content("Home#index")
  end

end

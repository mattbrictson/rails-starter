require 'acceptance/acceptance_helper'

feature 'Welcome' do

  scenario 'should show Welcome#index ' do
    visit homepage
    page.should have_content("Welcome#index")
  end

end

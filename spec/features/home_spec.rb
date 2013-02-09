require 'features/features_helper'

feature 'Home' do

  scenario 'should show Home#index' do
    visit homepage
    page.should have_content("Home#index")
  end

end

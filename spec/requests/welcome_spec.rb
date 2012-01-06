require 'spec_helper'

describe "Welcome" do
  describe "GET /" do
    it "displays a welcome" do
      visit root_path
      page.should have_content("Welcome#index")
    end
  end
end

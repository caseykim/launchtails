require 'rails_helper'

feature 'User creates a category', %Q{
  As a user
  I want to create a category
  So I can better categorize my drinks
} do

  scenario 'add a category' do
    category_name = 'New custom category'
    visit new_category_path

    fill_in 'Name', with: category_name

    click_button 'Add Category'

    expect(page).to have_content('Category added.')
    expect(page).to have_content(category_name)
  end

  scenario 'attempt to add an invalid category' do
    visit new_category_path

    click_button 'Add Category'

    expect(page).to have_content("can't be blank")
  end
end

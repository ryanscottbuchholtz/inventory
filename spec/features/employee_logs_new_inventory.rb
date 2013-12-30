require 'spec_helper'

feature 'Employee creates an inventory record', %q{
  As a food service Employee
  I want to recieve inventory
  So that it can be recorded that we have food items
} do

  # Acceptance Criteria:
  # * I must provide a title
  # * I must provide a description
  # * I must provide a quantity

  context 'with valid attributes (happy path)' do
    it 'creates an inventory record' do

      visit '/inventories/new'

      fill_in 'Title', with: 'Margarita Mix'
      fill_in 'Description', with: 'Sauza Brand'
      fill_in 'Quantity', with: 23

      click_on 'Create Inventory'

      expect(page).to have_content 'Inventory was successfully submitted.'
    end
  end

  context 'with invalid attributes' do
    it 'displays errors for invalid attributes' do

      visit '/inventories/new'

      click_on 'Create Inventory'

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "Quantity can't be blank"
    end
  end

    context 'with some valid attributes (mostly happy path)' do
    it 'creates an inventory record' do

      visit '/inventories/new'

      fill_in 'Title', with: 'Margarita Mix'
      fill_in 'Quantity', with: 23

      click_on 'Create Inventory'

      expect(page).to have_content "Description can't be blank"
    end
  end
end
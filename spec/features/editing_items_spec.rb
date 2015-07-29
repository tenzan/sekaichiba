require 'rails_helper'

RSpec.feature 'Users can edit existing items' do
  before do
    FactoryGirl.create(:item, name: 'Shampoo', quantity: 3)

    visit '/'
    click_link 'Shampoo'
    click_link 'Edit Item'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Shampoo New'
    fill_in 'Quantity', with: 1
    click_button 'Update Item'

    expect(page).to have_content 'Item has been updated.'
    expect(page).to have_content 'Shampoo New'
  end

  scenario 'when providing empty name' do
    fill_in 'Name', with: ''
    click_button 'Update Item'

    expect(page).to have_content 'Item has not been updated.'
  end

  scenario 'when providing empty quantity' do
    fill_in 'Quantity', with: ''
    click_button 'Update Item'

    expect(page).to have_content 'Item has not been updated.'
  end

end
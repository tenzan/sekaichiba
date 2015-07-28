require 'rails_helper'

RSpec.feature 'Users can create new items' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Item'

    fill_in 'Name', with: 'Shampoo'
    fill_in 'Quantity', with: '3'
    click_button 'Create Item'

    expect(page).to have_content 'Item has been created.'
  end

end
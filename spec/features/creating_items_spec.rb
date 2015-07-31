require 'rails_helper'

RSpec.feature 'Users can create new items' do
  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit '/'

    click_link 'New Item'
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Shampoo'
    fill_in 'Quantity', with: 3
    click_button 'Create Item'

    expect(page).to have_content 'Item has been created.'
  end
  scenario 'when providing invalid attributes' do
    click_button 'Create Item'

    expect(page).to have_content 'Item has not been created'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Quantity can't be blank"
  end
end
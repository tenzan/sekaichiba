require 'rails_helper'

RSpec.feature 'User can delete items' do
  scenario 'successfully' do
    FactoryGirl.create(:item, name: 'Shampoo', quantity: 3)

    visit '/'
    click_link 'Shampoo'
    click_link 'Delete Item'

    expect(page).to have_content 'Item has been deleted.'
    expect(page.current_url).to eq items_url
    expect(page).to have_no_content 'Shampoo'
  end
end
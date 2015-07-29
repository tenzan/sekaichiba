require 'rails_helper'

RSpec.feature 'Users can view items' do
  scenario 'with the item details' do
    item = FactoryGirl.create(:item, name: 'Shampoo', quantity: 3)

    visit '/'
    click_link 'Shampoo'
    expect(page.current_url).to eq item_url(item)
  end
end
require 'rails_helper'

RSpec.feature 'Users can create new comments' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    item = FactoryGirl.create(:item, name: 'Shampoo', quantity: 3)

    visit item_url(item)
    click_link 'New Comment'
  end

  scenario 'with valid attributes' do
    fill_in 'Body', with: 'Great Service!'
    click_button 'Create Comment'

    expect(page).to have_content 'Comment has been created.'
    within('#comment') do
      expect(page).to have_content "Author: #{user.email}"
    end
  end

  scenario 'when providing invalid attribute' do
    click_button 'Create Comment'

    expect(page).to have_content 'Comment has not been created.'
    expect(page).to have_content "Body can't be blank"
  end

  scenario 'with an invalid body' do
    fill_in 'Body', with: 'Hello!'
    click_button 'Create Comment'

    expect(page).to have_content 'Comment has not been created.'
    expect(page).to have_content 'Body is too short'
  end
end
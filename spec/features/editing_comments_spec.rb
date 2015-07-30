require 'rails_helper'

RSpec.feature 'Users can edit existing comments' do
  let(:author)  { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item) }
  let(:comment) do
    FactoryGirl.create(:comment, item: item, author: author)
  end

  before do
    visit item_comment_path(item, comment)
    click_link 'Edit Comment'
  end

  scenario 'with valid attributes' do
    fill_in 'Body', with: 'Ship ASAP please!'
    click_button 'Update Comment'

    expect(page).to have_content 'Comment has been updated.'

    within('#comment h2') do
      expect(page).to have_content 'Ship ASAP please!'
      expect(page).not_to have_content comment.body
    end
  end

  scenario 'with invalid attributes' do
    fill_in 'Body', with: ''
    click_button 'Update Comment'

    expect(page).to have_content 'Comment has not been updated.'
  end


end
require 'rails_helper'

RSpec.feature 'Users can delete comments' do
  let(:author) { FactoryGirl.create(:user)}
  let(:item) { FactoryGirl.create(:item) }
  let(:comment) do
    FactoryGirl.create(:comment, item: item, author: author)
  end

  before do
    visit item_comment_path(item, comment)
  end

  scenario 'successfully' do
    click_link 'Delete Comment'

    expect(page).to have_content 'Comment has been deleted.'
    expect(page.current_url).to eq item_url(item)
  end
end
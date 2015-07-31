require 'rails_helper'

RSpec.feature 'Users can only see the appropriate links' do
  let(:item) { FactoryGirl.create(:item) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context 'anonymous users' do
    scenario 'cannot see the New Item link' do
      visit '/'
      expect(page).not_to have_link 'New Item'
    end

    scenario 'cannot see the Delete Item link' do
      visit item_path(item)
      expect(page).not_to have_link 'Delete Item'
    end
  end

  context 'regular users' do
    before { login_as(user) }

    scenario 'can see the New Item link' do
      visit '/'
      expect(page).to have_link 'New Item'
    end

    scenario 'cannot see the Delete Item link' do
      visit item_path(item)
      expect(page).not_to have_link 'Delete Item'
    end
  end

  context 'admin users' do
    before { login_as(admin) }

    scenario 'can see the New Item link' do
      visit '/'
      expect(page).to have_link 'New Item'
    end

    scenario 'can see the Delete Item link' do
      visit item_path(item)
      expect(page).to have_link 'Delete Item'
    end
  end


end
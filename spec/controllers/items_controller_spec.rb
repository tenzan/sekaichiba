require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  it 'handles a missing item correctly' do
    get :show, id: 'not-here'

    expect(response).to redirect_to(items_path)

    message = 'The item could not be found.'
    expect(flash[:alert]).to eq message
  end

end

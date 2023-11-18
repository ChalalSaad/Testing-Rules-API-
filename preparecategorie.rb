




# spec

require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  it 'returns an empty response if order status is not processing' do
    post '/joozoori.com/wp-json/wc/v3', params: { status: 'completed' }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)).to be_empty
  end
end


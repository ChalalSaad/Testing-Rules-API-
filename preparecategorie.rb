

#Order Status Check:
#Rule: If the order status is not 'processing', return an empty dictionary.
#Test: Set the order status to 'completed' and verify that the script returns an empty dictionary.
#Data Processing:
#Rule: Verify that the script processes the input_data and constructs the request_form correctly.
#Test: Provide sample input_data with valid values and check if the request_form is constructed accurately.

#External API Request:
#Rule: Confirm that the script makes an external API request using the provided data.
#Test: Mock an API response and ensure the script handles it appropriately.



# spec

require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  it 'returns an empty response if order status is not processing' do
    post '/joozoori.com/wp-json/wc/v3', params: { status: 'completed' }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)).to be_empty
  end
end


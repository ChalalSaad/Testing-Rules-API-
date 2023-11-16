'''API Credentials:
    Rule: Verify that the API credentials are correctly extracted from input_data.
    Test: Provide input_data with valid API credentials and check if they are correctly assigned.

Signature Generation:
    Rule: Confirm that the script generates the correct signature using hashlib.
    Test: Provide input_data with specific credentials and verify if the generated signature matches expectations.

Print Order Generation:
    Rule: Validate that the PrintOrder instance is created and populated with the correct shipping information.
    Test: Provide input_data with different shipping information and confirm if the PrintOrder is constructed accurately.
'''

# spec

require 'rails_helper'

RSpec.describe 'Print Orders API', type: :request do
  it 'correctly generates print orders with provided shipping information' do
    post '/api/v1/', params: { orderid: '123', items: ['item1', 'item2'], delivery_full_name: 'Saad', delivery_address: '123 Main St' }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)).to include('orderid' => '123', 'delivery_full_name' => '', 'delivery_address' => '123 Main St')
  end
end



#Custom Attribute Normalization:
  #  Rule: Ensure that the script normalizes custom attributes based on the provided meta_data_keys.
   # Test: Provide input_data with custom attributes and check if normalization occurs correctly.

#Request Form Structure:
 #   Rule: Validate that the request_form is constructed with the normalized values.
  #  Test: Confirm that the request_form contains the expected keys and values.


# spec/


require 'rails_helper'

RSpec.describe 'Attributes API', type: :request do
  it 'normalizes custom attributes based on meta_data_keys' do
    post '/joozoori.com/wp-json/wc/v3', params: { meta_data_keys: 'Language(.*?),Extra' }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)['custom_extra_list']).to eq(['value1', 'value2'])
  end
end

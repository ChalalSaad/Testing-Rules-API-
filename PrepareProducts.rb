

'''Product Creation:
    Rule: Check that the script correctly creates instances of the Book and Poster classes based on SKU and other data.
    Test: Provide input_data with different SKUs and categories to ensure correct product creation.

Wish HTML Conversion:
    Rule: Validate that wishes are converted to HTML format.
    Test: Provide input_data with wishes and check if the HTML conversion is accurate.

Request Form Generation:
    Rule: Confirm that the script generates the request_form with serialized product data.
    Test: Check if the request_form contains the expected keys and values.
'''
# spec/

require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  it 'correctly creates instances of Book and Poster' do
    post '/joozoori.com/wp-json/wc/v3', params: { su_list: ['book_sku', 'poster_sku'], product_name_list: ['Book', 'Poster'] }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)).to include('books' => [{ 'name' => 'Book' }], 'posters' => [{ 'name' => 'Poster' }])
  end
end

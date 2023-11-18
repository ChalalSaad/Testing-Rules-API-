
## Stage 1: Order on WooCommerce

### Input
- Get an order from the WooCommerce api

### Output
- SKU
- Date created
- Status
- Customer
  - Billing
  - Email address
  - Phone
- Shipping
- Stock
- Ref
- Shipping Label
- Select a Second Language
- Arabic Name Field
- English/French Name
- Gender
- Select Cover
- Add Dedication


## Stage 2: Get Value in Storage by Zapier

- Get the value of the category from Zapier storage
- If false, create one on Zapier storage

## Stage 3: Prepare Category

### Input
- Parameters from an order in a WooCommerce store (using WooCommerce API)
  - status
  - orderid
  - product_ids
  - sku_list
  - consumer_key
  - consumer_secret
  - wc_url
  - categories

### Output
- category_names
- custom_dedication
- custom_language
- custom_gender
- custom_cover
- custom_arabic_name
- custom_en_fr_name
- all_titles
- all_sku
- custom_extra_list

## Stage 4: Prepare Optional Parameters

### Input
- meta_data_keys
- custom_extra_list
- custom_en_name_list

### Output
- request_form dictionary containing normalized values

## Stage 5: Prepare Products

### Input
- product_name_list
- custom_wishes_list
- custom_name_list
- custom_en_name_list
- custom_language_list
- custom_gender_list
- custom_cover_list
- custom_extra_list
- sku_list
- category_names

### Output
- items list containing product details

## Stage 6: Prepare Order

### Input
- Example data containing access credentials, order details, and items

### Output
- request to story api to get print  with a signature

## Stage 7: POST in Webhooks by Zapier

### Payload
```python
{
  "signature": "...",
  "username": "...",
  "access_password": "...",
  "key": "...",
  "orderid": "...",
  "item": "...",
  "delivery_full_name": "...",
  "delivery_address": "...",
  "delivery_zipcode": "...",
  "delivery_country": "...",
  "delivery_phone_number": "...",
  "delivery_email": "...",
  "test": "..."
}
```

#### Stage 8: Lookup Order Id

  - Track the order on a sheet (search by ID)
  - If ID does not exist, create a Google Sheet spreadsheet row

#### Stage 9: Only Continue If

  - Check Zap search status
  - If false, continue to the next stage

#### Stage 10: Create Spreadsheet Row

-   Create a Google Sheet row with columns:
 -     Date
  -    Order ID
   -   Status
   -   Customer Email
    -  Customer Name
    -  Customer Phone
-      Product(s)
 -     Items Total
  -    Shipping Total
   -   Total
    -  Billing Address
     - Billing Country
     - Billing City
     - Coupon(s)
     - Discount Total

#### Stage 11: Send Channel Message in Slack

-  Send a Slack message with purchase details
 -     Message Text
  -    New Order
   -   From
    -  Order Total
     - ID
     - Date Created
     - Address City
     - Discount Total
     - Line items

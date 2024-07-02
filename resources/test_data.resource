*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         FakerLibrary


*** Variables ***
${BASE_URL}        http://automationexercise.com
${BROWSER}         Chrome
${NAME_PREFIX}     TestUser  # Prefix for generating random names
${EMAIL_DOMAIN}    @example.com
${PASSWORD_MIN}     8
${PASSWORD_MAX}     12
${PRODUCT_NAME}    Blue Top
${INVOICE_FILENAME} invoice.pdf  # Expected invoice filename (modify if different)
${PAYMENT_DETAILS}  { name: John Doe, card_number: 1234567890123456, cvv: 123, expiry_date: 12/2025 }
























#*** Variables ***
#${NAME}        ${faker.name()}  # Using Faker library
#${EMAIL}       ${faker.email()}
#${PASSWORD}    Generate Password  # Implement logic using Faker (optional)
#${TITLE}       Mr
#${DOB_DAY}     15
#${DOB_MONTH}   6
#${DOB_YEAR}    1990
#${ADDRESS}     ${faker.address()}
#${COUNTRY}     # Update with your desired country selection logic (e.g., random index)
#${STATE}       ${faker.state()}
#${CITY}        ${faker.city()}
#${ZIPCODE}     ${faker.postcode()}  # Assuming 5 digits for zip code
#${MOBILE_NUMBER}  ${faker.phone_number()}  # Assuming 10 digits for mobile number
#${NEWSLETTER_CHECKED}  TRUE
#${OPTIN_CHECKED}       FALSE
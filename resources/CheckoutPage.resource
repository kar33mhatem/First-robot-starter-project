*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn

*** Keywords ***
CheckoutPage.Click Proceed To Checkout
    Click Element    xpath=//a[contains(text(),'Proceed To Checkout')]

CheckoutPage.Verify Checkout Page
    Element Text Should Be    xpath=//*[contains(text(),'Address Details')]    Address Details
    Element Text Should Be    xpath=//*[contains(text(),'Review Your Order')]    Review Your Order

CheckoutPage.Press Place Order
    Click Element    xpath=//a[contains(text(),'Place Order')]

CheckoutPage.Verify Payment Page
    Page Should Contain    Payment

CheckoutPage.Enter Payment Details
    [Arguments]    ${name_on_card}    ${card_number}    ${cvc}    ${expiration_mm}  ${expiration_yy}
    Input Text    name=name_on_card    ${name_on_card}
    Input Text    name=card_number    ${card_number}
    Input Text    name=cvc    ${cvc}
    Input Text    name=expiry_month    ${expiration_mm}
    Input Text    name=expiry_year    ${expiration_yy}

CheckoutPage.Click Pay and Confirm Order
    Click Element    xpath=//button[contains(text(),'Pay and Confirm Order')]

CheckoutPage.Verify Order Placed
#    Element Text Should Be    xpath=//*[contains(text(),'Your order has been placed successfully!')]    Your order has been placed successfully!
# Another implementaion for redicrect page
    Page Should Contain    Congratulations! Your order has been confirmed!

CheckoutPage.Click Download Invoice
    Click Element    xpath=//a[contains(text(),'Download Invoice')]
    Sleep    5s

CheckoutPage.Verify Invoice Downloaded
    [Arguments]         ${DOWNLOAD_FOLDER}   ${EXPECTED_INVOICE_NAME}
    [Documentation]    Verify that the invoice has been downloaded successfully.
    ${invoice_pattern}=    Catenate    SEPARATOR=    ${EXPECTED_INVOICE_NAME}    .*\.txt
    ${files}=    List Files In Directory    ${DOWNLOAD_FOLDER}
    ${matching_files}=    Create List
    FOR    ${file}    IN    @{files}
        ${is_match}=    Evaluate    re.match(r"${invoice_pattern}", "${file}") is not None    re
        Run Keyword If    ${is_match}    Append To List    ${matching_files}    ${file}
    END
    Should Not Be Empty    ${matching_files}

CheckoutPage.Verify Address Details and Review Order
    [Documentation]    Verify address details and review the order.
    # Add necessary verifications here
    Log To Console    Verifying address details and review order.
CheckoutPage.Verify Delivery Address
    [Arguments]    ${name}    ${address}    ${city}    ${state}    ${zipcode}    ${country}
    Element Text Should Be    xpath=//ul[@id='address_delivery']/li[@class='address_firstname address_lastname']    ${name}
    Element Text Should Be    xpath=//ul[@id='address_delivery']/li[@class='address_address1 address_address2'][2]    ${address}
    Element Text Should Be    xpath=//ul[@id='address_delivery']/li[@class='address_city address_state_name address_postcode']    ${city} ${state} ${zipcode}
    Element Text Should Be    xpath=//ul[@id='address_delivery']/li[@class='address_country_name']    ${country}

CheckoutPage.Verify Billing Address
    [Arguments]    ${name}    ${address}    ${city}    ${state}    ${zipcode}    ${country}
    Element Text Should Be    xpath=//ul[@id='address_invoice']/li[@class='address_firstname address_lastname']    ${name}
    Element Text Should Be    xpath=//ul[@id='address_invoice']/li[@class='address_address1 address_address2'][2]    ${address}
    Element Text Should Be    xpath=//ul[@id='address_invoice']/li[@class='address_city address_state_name address_postcode']    ${city} ${state} ${zipcode}
    Element Text Should Be    xpath=//ul[@id='address_invoice']/li[@class='address_country_name']    ${country}

CheckoutPage.Enter Order Comments
    [Arguments]    ${comments}
    Input Text    name=message    ${comments}



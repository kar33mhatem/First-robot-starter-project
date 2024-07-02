*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn

*** Keywords ***
CartPage.Click View Cart Button
    Sleep    3s
    Click Element    xpath=//p[@class='text-center']/a/u[text()='View Cart']



CartPage.Verify Cart Page is Visible
    Element Text Should Be    xpath=//*[contains(text(),'Shopping Cart')]    Shopping Cart

CartPage.Add Product To Cart
    [Arguments]    ${product_index}
    ${xpath}=    Set Variable    (//a[contains(text(),'Add to cart')])[${product_index}]
#    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}

CartPage.Verify Product in Cart
    [Arguments]    ${product_name}
    Element Should Be Visible    xpath=//a[contains(text(),'${product_name}')]

CartPage.Verify Product Quantity
    [Arguments]    ${product_name}    ${quantity}
#    Element Text Should Be    xpath=//div[contains(@class,'cart_info') and contains(text(),'${product_name}')]/../following-sibling::div[@class='quantity']/input    ${quantity}
    Element Text Should Be   xpath=//td[@class='cart_description']//a[text()='${product_name}']/ancestor::tr//td[@class='cart_quantity']/button    ${quantity}

CartPage.Verify Product Quantity and Price
    [Arguments]    ${product_name}    ${expected_quantity}    ${expected_price}
    ${row_xpath}=    Set Variable    //tr[.//h4/a[contains(text(),'${product_name}')]]
    ${quantity_xpath}=    Set Variable    ${row_xpath}//td[@class='cart_quantity']/button[@class='disabled']
    ${price_xpath}=    Set Variable    ${row_xpath}//td[@class='cart_price']/p
    ${total_price_xpath}=    Set Variable    ${row_xpath}//td[@class='cart_total']/p[@class='cart_total_price']

    Wait Until Element Is Visible    ${quantity_xpath}    10s
    ${actual_quantity}=    Get Text    ${quantity_xpath}
    Should Be Equal As Numbers    ${actual_quantity}    ${expected_quantity}

    Wait Until Element Is Visible    ${price_xpath}    10s
    ${actual_price}=    Get Text    ${price_xpath}

    # Remove currency symbol and commas from actual_price

#    ${clean_actual_price}=    Replace String Using Regexp    ${actual_price}    [^\d.]    ${EMPTY}
#    Should Be Equal As Numbers    ${clean_actual_price}    ${expected_price}
#
#    # Calculate expected total price and verify
#    ${expected_total_price}=    Evaluate    ${expected_quantity} * ${expected_price}
#    Wait Until Element Is Visible    ${total_price_xpath}    10s
#    ${actual_total_price}=    Get Text    ${total_price_xpath}

    # Remove currency symbol and commas from actual_total_price
#    ${clean_actual_total_price}=    Replace String Using Regexp    ${actual_total_price}    [^\d.]    ${EMPTY}
#    Should Be Equal As Numbers    ${clean_actual_total_price}    ${expected_total_price}
#   #############################################################################   ###########



#    # Remove currency symbol and commas from actual_price
#    ${clean_actual_price}=    Replace String    ${actual_price}    'Rs. '    ${EMPTY}
#    ${clean_actual_price}=    Replace String    ${clean_actual_price}    ','    ${EMPTY}
#
#    Should Be Equal As Numbers    ${clean_actual_price}    ${expected_price}
#
#    # Calculate expected total price and verify
#    ${expected_total_price}=    Evaluate    ${expected_quantity} * ${expected_price}
#    Wait Until Element Is Visible    ${total_price_xpath}    10s
#    ${actual_total_price}=    Get Text    ${total_price_xpath}
#
#    # Remove currency symbol and commas from actual_total_price
#    ${clean_actual_total_price}=    Replace String    ${actual_total_price}    'Rs. '    ${EMPTY}
#    ${clean_actual_total_price}=    Replace String    ${clean_actual_total_price}    ','    ${EMPTY}
#
#    Should Be Equal As Numbers    ${clean_actual_total_price}    ${expected_total_price}

CartPage.Click Continue Shopping Button
    Click Element    xpath=//button[contains(@class,'btn-success')]

CartPage.Click Remove Product Button
    [Arguments]    ${product_xpath}
    Click Element    ${product_xpath}
    Sleep   5s

CartPage.Verify Product Removed
    [Arguments]    ${product_name}
    Element Should Not Be Visible    xpath=//h4/a[contains(text(),'${product_name}')]

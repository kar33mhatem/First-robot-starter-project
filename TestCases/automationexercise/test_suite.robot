*** Settings ***
Library         SeleniumLibrary
Library           OperatingSystem
Resource          ../resources/HomePage.resource
Resource          ../resources/ProductPage.resource
#Resource          ../TestCases/resources/PlaceOrder.resource
Resource          ../resources/RegistrationPage.resource
Resource          ../resources/CartPage.resource
Resource          ../resources/CheckoutPage.resource
#Resource         ../resources/WebDriverProfile.py
library         Process
library         Dialogs

Test Teardown     Close All Browsers
Suite Teardown     Close All Browsers



*** Variables ***
${BASE_URL}  http://automationexercise.com
${EMAIL}     randomtestkarim45@mailinator.com
${PASSWORD}  test123
${PRODUCT_NAME}   Dress
${PRODUCT_Index1}   1
${PRODUCT_Index2}   3
${PRODUCT_NAME_1}  Blue Top
${PRODUCT_NAME_2}  Men Tshirt
${EXPECTED_QUANTITY_1}  1
${EXPECTED_PRICE_1}  Rs. 500
${EXPECTED_QUANTITY_2}  1
${EXPECTED_PRICE_2}  Rs. 400
${PRODUCT_QTY}  4
${category_name}    Women
${subcategory_name}     Dress
${brand_name}   H&M
${thanksfortext}    Thank you for your review.
${comments}     Call me to give you more details
${DOWNLOAD_FOLDER}    C:\\Users\\ArabDT\\Downloads
${EXPECTED_INVOICE_NAME}    invoice

*** Test Cases ***


Test Case 1: Register User
    #need to make account info variable
    [Documentation]    Register a new user on the website.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    HomePage.Click Signup/Login Button
    HomePage.Verify Text    New User Signup!
    RegistrationPage.Enter Name and Email    Karim Hatem    ${EMAIL}
    RegistrationPage.Click Signup Button
    HomePage.Verify Text    Enter Account Information
    RegistrationPage.Fill Account Information    Mr.    ${PASSWORD}    1    6    2000
    RegistrationPage.Fill Mandatory Details    Karim    Hatem    123 Street    5    NasrCity    Cairo    911911    1234567890
    RegistrationPage.Select Checkboxes
    RegistrationPage.Click Create Account Button
    RegistrationPage.Verify Account Created
    HomePage.Click Continue Button
    HomePage.Verify Logged in as Username
#    HomePage.Click Delete Account Button
#    HomePage.Verify Account Deleted

Test Case 4: Logout User
    [Documentation]    Logout a logged-in user.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    HomePage.Click Signup/Login Button
    HomePage.Verify Text    Login to your account
    RegistrationPage.Enter Login Credentials    ${EMAIL}    ${PASSWORD}
    RegistrationPage.Click Login Button
    HomePage.Verify Logged in as Username
    HomePage.Click Logout Button
    HomePage.Verify Navigated to Login Page

Test Case 5: Register User with Existing Email
    [Documentation]    Attempt to register a user with an existing email.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    HomePage.Click Signup/Login Button
    HomePage.Verify Text    New User Signup!
    RegistrationPage.Enter Name and Email    John Doe    ${EMAIL}
    RegistrationPage.Click Signup Button
    HomePage.Verify Text    Email Address already exist!

Test Case 2: Login User with Correct Email and Password
    [Documentation]    Login with correct credentials.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    HomePage.Click Signup/Login Button
    HomePage.Verify Text    Login to your account
    RegistrationPage.Enter Login Credentials    ${EMAIL}    ${PASSWORD}
    RegistrationPage.Click Login Button
    HomePage.Verify Logged in as Username
    HomePage.Click Delete Account Button
    HomePage.Verify Account Deleted

Test Case 3: Login User with Incorrect Email and Password
    [Documentation]    Login with incorrect credentials.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    HomePage.Click Signup/Login Button
    HomePage.Verify Text    Login to your account
    RegistrationPage.Enter Login Credentials    wrong@companymail.com    wrongpassword
    RegistrationPage.Click Login Button
    HomePage.Verify Text    Your email or password is incorrect!


Test Case 6: Contact Us Form
    [Documentation]    Submit the Contact Us form.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    HomePage.Click Contact Us Button
    HomePage.Verify Text    Get In Touch
    RegistrationPage.Fill Contact Us Form    John Doe    ${EMAIL}    Test Subject    Test Message
    RegistrationPage.Upload File    D:\\pythonProject\\resources\\uploadfile.pdf
    RegistrationPage.Click Submit Button
    RegistrationPage.Click OK Button
    HomePage.Verify Text    Success! Your details have been submitted successfully.
    HomePage.Click Home Button
    HomePage.Verify Home Page is Visible




Test Case 9: Search Product
    [Documentation]    Search for a product.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    ProductPage.Click Products Button
    ProductPage.Verify All Products Page is Visible
    ProductPage.Search Product    ${PRODUCT_NAME}
    ProductPage.Verify Searched Products Visible

Test Case 12: Add Products in Cart
    [Documentation]    Add multiple products to the cart.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    ProductPage.Click Products Button
    CartPage.Add Product To Cart     ${PRODUCT_Index1}
    Sleep    5s
    CartPage.Click Continue Shopping Button
    CartPage.Add Product To Cart     ${PRODUCT_Index2}
    Sleep    5s
    CartPage.Click View Cart Button
    CartPage.Verify Product in Cart    ${PRODUCT_NAME_1}
    CartPage.Verify Product in Cart    ${PRODUCT_NAME_2}
    CartPage.Verify Product Quantity and Price    ${PRODUCT_NAME_1}    ${EXPECTED_QUANTITY_1}    ${EXPECTED_PRICE_1}            # abos 3la total prices
    CartPage.Verify Product Quantity and Price    ${PRODUCT_NAME_2}    ${EXPECTED_QUANTITY_2}    ${EXPECTED_PRICE_2}            # abos 3la total prices

Test Case 13: Verify Product Quantity in Cart
    [Documentation]    Verify the product quantity in the cart.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    ProductPage.Click View Product Button    xpath=(//a[contains(text(),'View Product')])[${PRODUCT_Index1}]
    ProductPage.Verify Product Detail Opened
    ProductPage.Increase Quantity    ${PRODUCT_QTY}
    ProductPage.Click Add to Cart Button
    CartPage.Click View Cart Button
    CartPage.Verify Product Quantity    ${PRODUCT_NAME_1}    ${PRODUCT_QTY}

Test Case 14: Place Order: Register while Checkout

    [Documentation]    Place an order by registering during checkout.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    CartPage.Add Product To Cart    ${PRODUCT_Index1}               # changed from xpath=//div[@class='productinfo text-center'][1]
    CartPage.Click View Cart Button
    CartPage.Verify Cart Page is Visible
    CheckoutPage.Click Proceed To Checkout
    HomePage.Click Register/Login Button
    HomePage.Verify Text    New User Signup!
    RegistrationPage.Enter Name and Email    John Doe    ${EMAIL}
    RegistrationPage.Click Signup Button
    HomePage.Verify Text    Enter Account Information
    RegistrationPage.Fill Account Information    Mr.    ${PASSWORD}    1    6    2000
    RegistrationPage.Fill Mandatory Details    John    Doe    123 Street    5    California    Los Angeles    90001    1234567890
    RegistrationPage.Select Checkboxes
    RegistrationPage.Click Create Account Button
    RegistrationPage.Verify Account Created
    HomePage.Click Continue Button
    HomePage.Verify Logged in as Username
    HomePage.Click View Cart Button
    CartPage.Verify Cart Page is Visible
    CheckoutPage.Click Proceed To Checkout
    CheckoutPage.Verify Checkout Page
    CheckoutPage.Press Place Order
    CheckoutPage.Verify Payment Page
    CheckoutPage.Enter Payment Details    John Doe    4111111111111111    123    12   2029
    CheckoutPage.Click Pay and Confirm Order
    CheckoutPage.Verify Order Placed
    HomePage.Click Delete Account Button
    HomePage.Verify Account Deleted

Test Case 17: Remove Products From Cart
    [Documentation]    Remove products from the cart.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    CartPage.Add Product To Cart    ${PRODUCT_Index1}               # changed from xpath=//div[@class='productinfo text-center'][1]
    CartPage.Click View Cart Button
    CartPage.Verify Cart Page is Visible
    CartPage.Click Remove Product Button    xpath=//a[contains(@class,'cart_quantity_delete')]
    CartPage.Verify Product Removed         ${PRODUCT_NAME_1}

Test Case 18: View Category Products
    [Documentation]    View products by category.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    ProductPage.Verify Categories Visible
    ProductPage.Click Category    ${category_name}          #failed locator detection
    ProductPage.Click Sub-Category    ${subcategory_name}
    ProductPage.Verify Category Page    ${category_name}        ${subcategory_name}


Test Case 19: View & Cart Brand Products
    [Documentation]    View and cart products by brand.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    ProductPage.Click Products Button
    ProductPage.Verify Brands Visible
    ProductPage.Click Brand    ${brand_name}
    ProductPage.Verify Brand Page    ${brand_name}


Test Case 21: Add Review on Product
    [Documentation]    Add a review on a product.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    ProductPage.Click Products Button
    ProductPage.Verify All Products Page is Visible
    ProductPage.Click View Product Button   ${PRODUCT_Index1}   # ana change kolo to : ${PRODUCT_Index1} ,  need to change implementation keyword
    ProductPage.Verify Write Your Review Visible
    ProductPage.Enter Review Details    John Doe    ${EMAIL}    Great product!
    ProductPage.Click Submit Button
    HomePage.Verify Text    ${thanksfortext}

Test Case 23: Verify Address Details in Checkout Page
    [Documentation]    Verify address details during checkout.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    CartPage.Add Product To Cart    ${PRODUCT_Index1}
    CartPage.Click View Cart Button
    CartPage.Verify Cart Page is Visible
    CheckoutPage.Click Proceed To Checkout
    HomePage.Click Register/Login Button
    HomePage.Verify Text    New User Signup!
    RegistrationPage.Enter Name and Email    John Doe    ${EMAIL}
    RegistrationPage.Click Signup Button
    HomePage.Verify Text    Enter Account Information
    RegistrationPage.Fill Account Information    Mr.    ${PASSWORD}    1    6    2000
    RegistrationPage.Fill Mandatory Details    John    Doe    123 Street    5    California    Los Angeles    90001    1234567890
    RegistrationPage.Select Checkboxes
    RegistrationPage.Click Create Account Button
    RegistrationPage.Verify Account Created
    HomePage.Click Continue Button
    HomePage.Verify Logged in as Username
    HomePage.Click View Cart Button
    CartPage.Verify Cart Page is Visible
    CheckoutPage.Click Proceed To Checkout
    CheckoutPage.Verify Checkout Page
    CheckoutPage.Verify Delivery Address    Mr. John Doe    123 Street    Los Angeles    California    90001    New Zealand
    CheckoutPage.Verify Billing Address     Mr. John Doe    123 Street    Los Angeles    California    90001    New Zealand
    HomePage.Click Delete Account Button
    HomePage.Verify Account Deleted

Test Case 24: Download Invoice after Purchase Order
    # have to recheck and implement again
    [Documentation]    Download the invoice after placing an order.
    HomePage.Launch Browser
    HomePage.Navigate to URL    ${BASE_URL}
    HomePage.Verify Home Page is Visible
    CartPage.Add Product To Cart    ${PRODUCT_Index1}
    CartPage.Click View Cart Button
    CartPage.Verify Cart Page is Visible
    CheckoutPage.Click Proceed To Checkout
    HomePage.Click Register/Login Button
    HomePage.Verify Text    New User Signup!
    RegistrationPage.Enter Name and Email    John Doe    ${EMAIL}
    RegistrationPage.Click Signup Button
    HomePage.Verify Text    Enter Account Information
    RegistrationPage.Fill Account Information    Mr.    ${PASSWORD}    1    6    2000
    RegistrationPage.Fill Mandatory Details    Kimo    Smsm    123 Street    5   October    MotherofWorld     90001    1234567890
    RegistrationPage.Select Checkboxes
    RegistrationPage.Click Create Account Button
    RegistrationPage.Verify Account Created
    HomePage.Click Continue Button
    HomePage.Verify Logged in as Username
    HomePage.Click View Cart Button
    CheckoutPage.Click Proceed To Checkout
    CheckoutPage.Verify Address Details and Review Order
    CheckoutPage.Enter Order Comments    ${comments}
    CheckoutPage.Press Place Order
    CheckoutPage.Verify Payment Page
    CheckoutPage.Enter Payment Details    Kimo    SmsmVisa    4111111111111111    123    12   2029
    CheckoutPage.Click Pay and Confirm Order
    CheckoutPage.Verify Order Placed
    CheckoutPage.Click Download Invoice
    CheckoutPage.Verify Invoice Downloaded    ${DOWNLOAD_FOLDER}    ${EXPECTED_INVOICE_NAME}
    HomePage.Click Continue Button
    HomePage.Click Delete Account Button
    HomePage.Verify Account Deleted






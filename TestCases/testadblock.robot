#*** Settings ***
#Library    Browser
#Library    SeleniumLibrary
#
#*** Variables ***
#${EXTENSION_URL}    https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
#${EXT_INSTALL_BTN}    //a[contains(text(), "Add to Firefox")]
#
#*** Test Cases ***
#Install Firefox Extension
#    Browser.Open Browser    ${EXTENSION_URL}    firefox    # Using Browser library's Open Browser
##    Browser.Wait Until Element Is Visible    ${EXT_INSTALL_BTN}    timeout=10
#    Browser.Click    ${EXT_INSTALL_BTN}



#    Wait Until Page Contains  Remove from Chrome













*** Settings ***
Library    Browser

*** Variables ***
${EXTENSION_PATH}    d:\\pythonProject\\resources\\uBlock-Origin    # Path to the extracted Adblock extension directory

*** Test Cases ***
Test with Adblock Extension
    [Documentation]    This test case opens a browser with the Adblock extension and navigates to a website to verify Adblock functionality.
    Open Browser With Adblock
    New Page    https://automationexercise.com/
    # Add your test steps to verify Adblock functionality here
    Close Browser

*** Keywords ***
Open Browser With Adblock
    [Documentation]    Opens a Chromium browser with the Adblock extension.
    New Browser    chromium    headless=False
    ${context}=    New Context    ${EXTENSION_PATH}
    New Page    about:blank


#*** Settings ***
#Library     SeleniumLibrary
#Library    Browser
#Library    Process
#Library         SeleniumLibrary
#Library           OperatingSystem
#Resource          ../resources/HomePage.resource
#Resource          ../resources/ProductPage.resource
##Resource          ../resources/PlaceOrder.resource
#Resource          ../resources/RegistrationPage.resource
#Resource          ../resources/CartPage.resource
#Resource          ../resources/CheckoutPage.resource
#library         Process
#library         Dialogs
#Library         ../resources/WebDriverProfile.py
#Library         ../TestCases/test.robot
#Test Teardown     Close All Browsers
#Suite Teardown     Close All Browsers
#
#*** Variables ***
##${EXTENSION_PATH}    /path/to/adblock-extension
#
#*** Test Cases ***
#test.Test Browser with Adblock
#    # Launch the browser with Adblock extension using a custom Python script
#    Run Process    python    WebDriverProfile.py
#
#    # Continue with other test steps using the Browser library
#    New Browser    chromium
#    New Page    https://automationexercise.com/
#    HomePage.Navigate to URL    ${BASE_URL}
#    HomePage.Verify Home Page is Visible
#    HomePage.Click Signup/Login Button
#    HomePage.Verify Text    New User Signup!
#    RegistrationPage.Enter Name and Email    John Doe    ${EMAIL}
#    RegistrationPage.Click Signup Button
#    HomePage.Verify Text    Enter Account Information
#    RegistrationPage.Fill Account Information    Mr.    ${PASSWORD}    1    6    2000
#    RegistrationPage.Fill Mandatory Details    John    Doe    123 Street    5    California    Los Angeles    90001    1234567890
#    RegistrationPage.Select Checkboxes
#    RegistrationPage.Click Create Account Button
#    RegistrationPage.Verify Account Created
#    HomePage.Click Continue Button
#    HomePage.Verify Logged in as Username
#    HomePage.Click Delete Account Button
#    HomePage.Verify Account Deleted
#    Close Browser














#*** Setting ***
#Library    SeleniumLibrary
#Library    AutoItLibrary
#Library    Process
#
#*** Variable ***
#${url}=    http://automationexercise.com
#${ff}=    C:\\Users\\ArabDT\\AppData\\Local\\Mozilla\\Firefox\\Profiles\\d7aboz2y.default-release
#
#***Test Case***
#Start_Firefox
##    [Arguments]    ${URL}
#    ${FF_PROFILE}=    Set Variable    C:\\Users\\ArabDT\\AppData\\Local\\Mozilla\\Firefox\\Profiles\\d7aboz2y.default-release
#    Open Browser    ${URL}     browser=ff    ff_profile_dir=${FF_PROFILE}
#

*** Settings ***
Library    SeleniumLibrary
#Library         ../resources/WebDriverProfile.py

*** Variables ***
${BROWSER}      chrome
${BASE_URL}     http://automationexercise.com
${HOMEPAGE_TITLE}    Automation Exercise
${EXTENSION URL}  https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
${EXT INSTALL BTN}  //*[contains(text(), "Add to Chrome")]

*** Keywords ***
HomePage.Launch Browser
    [Documentation]    Launch the browser and open the application.
    Open Browser  ${EXTENSION URL}  chrome
    Maximize Browser Window
#    Wait Until Page Contains  Extension name here
    Click Element  ${EXT INSTALL BTN}
#    Sleep    20s
#    Press Keys    NONE    ENTER
#    Press Keys    NONE    LEFT
    Sleep  30 sec
#    Alert Should Be Present
#    Handle Alert    ACCEPT

#
#    Sleep    1 second
#    Open Browser    ${BASE_URL}    ${BROWSER}
#    Maximize Browser Window

HomePage.Navigate to URL
#    create web driver with addons
    [Arguments]    ${url}
    Go To    ${url}

HomePage.Verify Home Page is Visible
    Title Should Be    ${HOMEPAGE_TITLE}

HomePage.Click Signup/Login Button
    Click Element    xpath=//a[contains(text(),'Signup / Login')]

HomePage.Verify Text
    [Arguments]    ${thanksfortext}
    Page Should Contain   ${thanksfortext}

HomePage.Click Continue Button
    Click Element    xpath=//a[contains(text(),'Continue')]

HomePage.Verify Logged in as Username
    Element Should Be Visible    xpath=//*[contains(text(),'Logged in as')]

HomePage.Click Delete Account Button
    Click Element    xpath=//a[contains(text(),'Delete Account')]

HomePage.Verify Account Deleted
    Page Should Contain   Account Deleted!


HomePage.Click Contact Us Button
    Click Element    xpath=//a[contains(text(),'Contact us')]

HomePage.Click Home Button
    Click Element    xpath=//a[contains(text(),'Home')]

HomePage.Click Logout Button
    Click Element    xpath=//a[contains(text(),'Logout')]

HomePage.Verify Navigated to Login Page
    Element Should Be Visible    xpath=//*[contains(text(),'Login to your account')] # same page for register maybe to reuse previous funct

HomePage.Click View Cart Button
    Sleep    3s
    Click Element    css:a[href*='view_cart']

HomePage.Click Register/Login Button
     Sleep    5s
     Click Element    xpath=//a[contains(., 'Register / Login')]

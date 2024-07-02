*** Settings ***
Library    SeleniumLibrary
Library     ChromeExtensionLibrary


*** Variables ***
${BROWSER}      firefox
${BASE_URL}     http://automationexercise.com
${HOMEPAGE_TITLE}    Automation Exercise
${EXTENSION URL}  https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
${EXT INSTALL BTN}  //*[contains(text(), "Add to Chrome")]

*** Test Cases ***
Test Extension Confirmation
    [Documentation] Simulates adding an extension and handling the confirmation popup.
    # Library import (replace with actual path)
    Library    ChromeExtensionLibrary   ../path/to/ChromeExtensionLibrary.robot
    # Extension ID (replace with actual ID)
    ${extension_id}    Set Variable    <extension_id>
    ChromeExtensionLibrary.Install Extension    ${extension_id}  # Install extension
    # You might need additional steps to verify successful installation

*** Keywords ***
# Your other keywords here
Extadd
    [Documentation]    Launch the browser and open the application.
    Open Browser  ${EXTENSION URL}  chrome
    Maximize Browser Window
#    Wait Until Page Contains  Extension name here
    Click Element  ${EXT INSTALL BTN}
    Sleep    20s
    Press Key    locator    key
    Press Keys    LEFT
    Press Keys    ENTER
    Alert Should Be Present

    Sleep  20 sec
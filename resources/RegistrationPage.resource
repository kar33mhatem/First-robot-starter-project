

*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
RegistrationPage.Enter Name and Email
    [Arguments]    ${name}    ${email}
    Input Text    name=name    ${name}
    Input Text    (//input[@name='email'])[2]    ${email}

RegistrationPage.Click Signup Button
    Click Element    xpath=//button[contains(text(),'Signup')]

RegistrationPage.Fill Account Information
    [Arguments]    ${title}      ${password}    ${day}    ${month}    ${year}
    Select Radio Button    title    Mr
    Input Text    name=password    ${password}
    Select From List By Value   name=days    ${day}
    Select From List By Value   name=months    ${month}
    Select From List By Value   name=years    ${year}

RegistrationPage.Fill Mandatory Details
    [Arguments]    ${firstname}    ${lastname}    ${address}    ${country}    ${state}    ${city}    ${zipcode}    ${mobile}
    Input Text    name=first_name    ${firstname}
    Input Text    name=last_name    ${lastname}
    Input Text    name=address1    ${address}
    Select From List By Index  name=country    ${country}
    Input Text    name=state    ${state}
    Input Text    name=city    ${city}
    Input Text    name=zipcode    ${zipcode}
    Input Text    name=mobile_number    ${mobile}

RegistrationPage.Select Checkboxes
    Select Checkbox    id:newsletter
    Unselect Checkbox    id:optin

RegistrationPage.Click Create Account Button
    Scroll Element Into View    xpath=//button[contains(text(),'Create Account')]
    Click Element    xpath=//button[contains(text(),'Create Account')]

RegistrationPage.Verify Account Created
    Page Should Contain   Account Created!
 #   Page Should Contain   //a[contains(text(),'Continue')]


 RegistrationPage.Enter Login Credentials
    [Arguments]    ${email}    ${password}
    Input Text    name=email    ${email}
    Input Text    name=password    ${password}

RegistrationPage.Click Login Button
    Click Element    xpath=//button[contains(text(),'Login')]


RegistrationPage.Fill Contact Us Form
    [Arguments]    ${name}    ${email}    ${subject}    ${message}
    Input Text    name=name    ${name}
    Input Text    name=email    ${email}
    Input Text    name=subject    ${subject}
    Input Text    name=message    ${message}

RegistrationPage.Upload File
    [Arguments]    ${file_path}
    Choose File    name=upload_file    ${file_path}
    Sleep    10s

RegistrationPage.Click Submit Button
    Click Element    xpath=//input[@type='submit']
    Sleep    10s

RegistrationPage.Click OK Button
    Alert Should Be Present
#    Handle Alert    ACCEPT











#*** Keywords ***
#Register New User  [Arguments]  ${name}  ${email}  ${password}
#    # Implement logic to fill registration form and submit
#    ...
#
#Verify Logged In User  [Arguments]  ${expected_username}
#    # Implement logic to verify logged-in user name
#    ...

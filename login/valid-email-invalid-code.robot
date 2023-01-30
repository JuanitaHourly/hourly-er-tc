*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Open the Hourly test app page 
    Comment    Checking I'm in the right url site
    Open Browser   ${urlSite}    ${browser}
    Maximize Browser Window
    Page Should Contain    Hourly
    Sleep    1

Entering a valid email
    Comment    try to login with a valid but not existing email
    Input Text    name:phone-number-or-email    ${validMail}

Checking the button
    Comment    If the email is valid, the button must be enabled
    Element Should Be Enabled    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/button

Clicking the button
    Click Button    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/button
    Sleep    2

Open the verification code screen
    Comment    The verification code screen must open 
    Element Should Contain    xpath://*[@id="root"]/div[1]/div[1]/div[2]/div[1]    Enter code

Enter an invalid code
    Comment    Entering an inavlid code 
    Input Text    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/div/input    ${invalidCode}

Clicking te continue button
    Click Button    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/button[1]
    Sleep    1

Display an error message
    Comment    If the code is invalid, display an error message
    Element Should Contain    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/div/div    ${errorMessage}
    Sleep    1
*** Variables ***
${urlSite}=  https://app.test.hourly.io/
${browser}=  Chrome
${validMail}=  juanita.triana@hourly.io
${invalidCode}=  1234
${errorMessage}=  Invalid code 

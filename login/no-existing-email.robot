*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Open the Hourly test app page 
    Comment    Checking I'm in the right url site
    Open Browser   ${urlSite}    ${browser}
    Maximize Browser Window
    Page Should Contain    Hourly

Entering a valid email
    Comment    try to login with a valid but not existing email
    Input Text    name:phone-number-or-email    ${invalidMail}

Checking the button
    Comment    If the email is valid, the button must be enabled
    Element Should Be Enabled    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/button

Clicking te button
    Click Button    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/button
    Sleep    3

Error message must be displayed
    Comment    if the user does not exist, display a message
    Element Should Contain    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/p    ${errorMessage}
    Sleep    4
    

*** Variables ***
${urlSite}=  https://app.test.hourly.io/
${browser}=  Chrome
${invalidMail}=  juliana@hourly.io
${errorMessage}=  User was not found


*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Open the Hourly test app page 
    Comment    Checking I'm in the right url site
    Open Browser   ${urlSite}    ${browser}
    Maximize Browser Window
    Page Should Contain    Hourly

Entering an invalid email
    Comment    try to login with an invalid email
    Input Text    name:phone-number-or-email    ${invalidMail}

Checking the button
    Comment    If the email is invalid, the button must be disabled
    Element Should Be Disabled    xpath://*[@id="root"]/div[1]/div[1]/div[2]/form/button
    Sleep    2


*** Variables ***
${urlSite}=  https://app.test.hourly.io/
${browser}=  Chrome
${invalidMail}=  juanita.com

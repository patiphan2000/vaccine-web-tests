*** Settings ***
Library         Selenium2Library
Test Setup      Run Keywords  Open Browser  ${BASE_URL}  ${BROWSER}
...  AND        Log to console  ${MESSAGE}
Test Teardown   Close All Browsers
Suite Setup     Log to console  Hello World
Suite Teardown  Log to console  Goodbye!!!

*** Variables ***
${BASE_URL}    https://vaccine-haven.herokuapp.com/
${SIGNUP_URL}    https://vaccine-haven.herokuapp.com/registration
${RESERV_URL}    https://vaccine-haven.herokuapp.com/reservation
${BROWSER}    gc
${MESSAGE}    hacking in progress...
${SITE_NAME}    OGYHSite

*** Keywords ***
Go to
    [Arguments]    ${wanted_url}
    Open Browser    ${wanted_url}  ${BROWSER}
    Set Selenium Speed    0.1

Page Should Be Open
    [Arguments]    ${wanted_url}
    Location Should Be    ${wanted_url}

Input Information
    [Arguments]    ${name}    ${text}
    Input Text    identifier=${name}   ${text}


*** Test Cases ***
Try to open signup page
    Go to    ${SIGNUP_URL}
    Page Should Be Open    ${SIGNUP_URL}

Input Register Information
    Go to    ${SIGNUP_URL}
    # Input Information    Peter    Parker    123    5049044113691    spider-man    Newyork    spider-man@email.com    Amazing-Fantasy-#15
    Input Information    citizen_id    5049044113691
    Input Information    name    Peter
    Input Information    surname    Parker
    Input Information    birth_date    10-02-2004
    Input Information    occupation    super hero
    Input Information    phone_number    888-542-1721
    Input Information    address    123st. wow city

Input Reservation Information
    Go to    ${RESERV_URL}
    Input Information    citizen_id    5049044113691
    Select From List by value    identifier=site_name    ${SITE_NAME}
    Select From List by value    identifier=vaccine_name    Pfizer
    Select From List by value    identifier=vaccine_name    Astra
    Select From List by value    identifier=vaccine_name    Sinopharm
    Select From List by value    identifier=vaccine_name    Sinovac

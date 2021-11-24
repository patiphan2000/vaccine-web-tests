*** Settings ***
Library         Selenium2Library
Test Setup      Run Keywords  Open Browser  ${BASE_URL}  ${BROWSER}
...  AND        Log to console  ${MESSAGE}
Test Teardown   Close All Browsers
Suite Setup     Log to console  Hello World
Suite Teardown  Log to console  Goodbye!!!

*** Variables ***
${BASE_URL}    https://service-taker.vercel.app/login
${SIGNUP_URL}    https://service-taker.vercel.app/signup
${BROWSER}    gc
${MESSAGE}    hacking in progress...

*** Keywords ***
Go to
    [Arguments]    ${wanted_url}
    Open Browser    ${wanted_url}  ${BROWSER}
    Set Selenium Speed    0.3

Page Should Be Open
    [Arguments]    ${wanted_url}
    Location Should Be    ${wanted_url}

Input Information
    [Arguments]    ${name}    ${surname}    ${id}    ${date}    ${occ}    ${addr}    ${email}    ${password}
    Input Text    identifier=name    ${name}
    Input Text    identifier=surname    ${surname}
    Input Text    identifier=citizen_id    ${id}
    Input Text    identifier=date    ${date}
    Input Text    identifier=occupation    ${occ}
    Input Text    identifier=address    ${addr}
    Input Text    identifier=email    ${email}
    Input Password    identifier=password    ${password}

*** Test Cases ***
Try to open signup page
    Go to    ${BASE_URL}
    Click Button    identifier=signup-btn
    Page Should Be Open    ${SIGNUP_URL}

Input Register Information
    Go to    ${SIGNUP_URL}
    Input Information    Peter    Parker    123    10081962    spider-man    Newyork    spider-man@email.com    Amazing-Fantasy-#15

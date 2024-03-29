*** Settings ***
Library         Selenium2Library
Test Setup      Run Keywords  Open Browser  ${MAIN_URL}  ${BROWSER}
...  AND        Log to console  ${MESSAGE}
Test Teardown   Close All Browsers
Suite Setup     Log to console  Hello World
Suite Teardown  Log to console  Goodbye!!!

*** Variables ***
${MAIN_URL}    https://vaccine-haven.herokuapp.com/
${RESERV_URL}    https://vaccine-haven.herokuapp.com/reservation
${INFO_URL}    https://vaccine-haven.herokuapp.com/info
${BROWSER}    gc
${MESSAGE}    hacking in progress...
${SITE_NAME}    OGYHSite
${CITIZEN_ID}    9621054668494
${PERFER_VACCINE}    Pfizer

*** Keywords ***
Go to
    [Arguments]    ${wanted_url}
    Open Browser    ${wanted_url}  ${BROWSER}
    Set Selenium Speed    0.1

Page Should Be
    [Arguments]    ${wanted_url}
    Location Should Be    ${wanted_url}

Input Information
    [Arguments]    ${name}    ${text}
    Input Text    identifier=${name}   ${text}


*** Test Cases ***
Try to open reservation page
    Go to    ${RESERV_URL}
    Page Should Be    ${RESERV_URL}

Vaccine Reservation
    Go to    ${RESERV_URL}
    Input Information    citizen_id    ${CITIZEN_ID}
    Select From List by value    identifier=site_name    ${SITE_NAME}
    Select From List by value    identifier=vaccine_name    ${PERFER_VACCINE}
    Click Button    identifier=reserve__btn

Check Vaccine Reservation
    Go to    ${INFO_URL}
    Input Information    citizen_id    ${CITIZEN_ID}
    Click Button    identifier=info__btn
    Wait Until Page Contains Element    identifier=cancel__btn
    
    ${vac_info}  Get Text  //*[@id="reserve_vaccine_value"]
    Should Be Equal  ${vac_info}  ${PERFER_VACCINE}

    ${vac_info}  Get Text  //*[@id="reserve_site_value"]
    Should Be Equal  ${vac_info}  ${SITE_NAME}

Cancel reservation
    Go to    ${INFO_URL}
    Input Information    citizen_id    ${CITIZEN_ID}
    Click Button    identifier=info__btn
    Wait Until Page Contains Element    identifier=cancel__btn
    Click Button    identifier=cancel__btn

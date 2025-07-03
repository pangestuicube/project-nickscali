*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/locators/checkout_page_locator.resource
Variables       ../resources/data/testdata.py


*** Keywords ***
Input User Email
    [Documentation]    Input user email in checkout page
    [Arguments]    ${email}
    Wait Until Element Is Enabled    locator=${EMAIL_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${EMAIL_INPUT}    text=${email}
    Wait Until Element Is Enabled    locator=${NEXT_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${NEXT_BUTTON}
    Wait Until Element Is Not Visible    locator=${EMAIL_INPUT}    timeout=${TIMEOUT_LONG}

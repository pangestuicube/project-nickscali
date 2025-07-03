*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/data/testdata.py
Resource        ../resources/locators/homepage_locator.resource


*** Keywords ***
Go To Home Page
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    locator=${SEARCH_BUTTON}    timeout=${TIMEOUT_LONG}

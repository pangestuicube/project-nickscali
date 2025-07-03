*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/locators/homepage_locator.resource
Variables       ../resources/data/testdata.py


*** Keywords ***
Fill Search Box
    [Documentation]    Fill search box
    [Arguments]    ${keyword}
    Wait Until Element Is Enabled    locator=${SEARCH_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${SEARCH_BUTTON}
    Wait Until Element Is Enabled    locator=${SEARCH_TEXTBOX}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${SEARCH_TEXTBOX}    text=${keyword}

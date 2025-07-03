*** Settings ***
Documentation       This file contains keywords for general use

Library             String
Library             SeleniumLibrary
Variables           ../resources/data/testdata.py
Resource            ../resources/locators/homepage_locator.resource


*** Keywords ***
Go To Home Page
    [Documentation]    Navigate to the homepage and wait until the search button is visible.
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    locator=${SEARCH_BUTTON}    timeout=${TIMEOUT_LONG}

Normalize Price Value
    [Documentation]    Normalize price value by removing dollar sign and commas (e.g., "$1780.00" or "$1780") to an integer.
    [Arguments]    ${price_value}
    ${normalized_price}=    Replace String    ${price_value}    $    ${EMPTY}
    ${normalized_price}=    Replace String    ${normalized_price}    .00    ${EMPTY}
    ${normalized_price_int}=    Convert To Integer    ${normalized_price}
    RETURN    ${normalized_price_int}

*** Settings ***
Documentation       This file contains keywords for thankyou page

Library             SeleniumLibrary
Resource            ../resources/locators/thankyou_page_locator.resource
Variables           ../resources/data/testdata.py


*** Keywords ***
Validate User Redirect To Thank You Page
    [Documentation]    Validate user redirect to thankyou page
    Wait Until Page Contains Element    locator=${THANKYOU_PAGE_BANNER}    timeout=${TIMEOUT_LONG}
    Wait Until Element Is Visible    locator=${SUCCESS_PLACE_ORDER_MESSAGE}    timeout=${TIMEOUT_LONG}

Click Continue Shopping Button
    [Documentation]    Click continue shopping button in thankyou page
    Wait Until Page Contains Element    locator=${CONTINUE_SHOPPING_BUTTON}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${CONTINUE_SHOPPING_BUTTON}
    Wait Until Element Is Enabled    locator=${CONTINUE_SHOPPING_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${CONTINUE_SHOPPING_BUTTON}
    Wait Until Element Is Not Visible    locator=${CONTINUE_SHOPPING_BUTTON}    timeout=${TIMEOUT_LONG}

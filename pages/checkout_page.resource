*** Settings ***
Documentation       This file contains keywords for checkout page

Library             SeleniumLibrary
Resource            ../resources/locators/checkout_page_locator.resource
Variables           ../resources/data/testdata.py


*** Keywords ***
Input User Email
    [Documentation]    Input user email in checkout page
    [Arguments]    ${email}
    Wait Until Element Is Enabled    locator=${EMAIL_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${EMAIL_INPUT}    text=${email}
    Wait Until Element Is Enabled    locator=${NEXT_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${NEXT_BUTTON}
    Wait Until Element Is Not Visible    locator=${EMAIL_INPUT}    timeout=${TIMEOUT_LONG}

Input Delivery Address
    [Documentation]    Input delivery address in checkout page
    Wait Until Element Is Enabled    locator=${FIRST_NAME_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${FIRST_NAME_INPUT}    text=${FIRST_NAME}
    Wait Until Element Is Enabled    locator=${LAST_NAME_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${LAST_NAME_INPUT}    text=${LAST_NAME}
    Wait Until Element Is Enabled    locator=${MOBILE_PHONE_NUMBER_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${MOBILE_PHONE_NUMBER_INPUT}    text=${MOBILE_PHONE_NUMBER}
    Wait Until Element Is Enabled    locator=${STREET_ADDRESS_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${STREET_ADDRESS_INPUT}    text=${street_address}
    Press Keys    ${STREET_ADDRESS_INPUT}    ARROW_DOWN
    Press Keys    ${STREET_ADDRESS_INPUT}    ENTER

Click Next Review Button
    [Documentation]    Click next button in checkout page
    Wait Until Element Is Enabled    locator=${NEXT_REVIEW_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${NEXT_REVIEW_BUTTON}
    Wait Until Element Is Not Visible    locator=${NEXT_REVIEW_BUTTON}    timeout=${TIMEOUT_LONG}

Check Terms And Conditions Checkbox
    [Documentation]    Check terms and conditions checkbox in checkout page
    Wait Until Page Contains Element    locator=${TERMS_AND_CONDITIONS_CHECKBOX_3}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${TERMS_AND_CONDITIONS_CHECKBOX_3}
    Wait Until Element Is Enabled    locator=${TERMS_AND_CONDITIONS_CHECKBOX_1}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${TERMS_AND_CONDITIONS_CHECKBOX_1}
    Click Element    locator=${TERMS_AND_CONDITIONS_CHECKBOX_2}
    Click Element    locator=${TERMS_AND_CONDITIONS_CHECKBOX_3}

Click Next Payment Button
    [Documentation]    Click next button in checkout page
    Wait Until Page Contains Element    locator=${NEXT_PAYMENT_BUTTON}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${NEXT_PAYMENT_BUTTON}
    Wait Until Element Is Enabled    locator=${NEXT_PAYMENT_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${NEXT_PAYMENT_BUTTON}
    Wait Until Element Is Not Visible    locator=${NEXT_PAYMENT_BUTTON}    timeout=${TIMEOUT_LONG}

Select Adyen Credit Card Payment Method
    [Documentation]    Select adyen credit card payment method in checkout page
    Wait Until Page Contains Element    locator=${ADYEN_CREDIT_CARD_PAYMENT_METHOD}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${ADYEN_CREDIT_CARD_PAYMENT_METHOD}
    Wait Until Element Is Enabled    locator=${ADYEN_CREDIT_CARD_PAYMENT_METHOD}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${ADYEN_CREDIT_CARD_PAYMENT_METHOD}

Input Adyen Credit Card Details
    [Documentation]    Input adyen credit card details in checkout page
    Wait Until Page Contains Element    locator=${ADYEN_CC_CARD_NUMBER_IFRAME_XPATH}    timeout=${TIMEOUT_LONG}
    Select Frame    locator=${ADYEN_CC_CARD_NUMBER_IFRAME_XPATH}
    Wait Until Page Contains Element    locator=${ADYEN_CC_CARD_NUMBER_INPUT}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${ADYEN_CC_CARD_NUMBER_INPUT}
    Wait Until Element Is Enabled    locator=${ADYEN_CC_CARD_NUMBER_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${ADYEN_CC_CARD_NUMBER_INPUT}    text=${ADYEN_CC_CARD_NUMBER}
    Unselect Frame

    Wait Until Page Contains Element    locator=${ADYEN_CC_EXPIRY_DATE_IFRAME_XPATH}    timeout=${TIMEOUT_LONG}
    Select Frame    locator=${ADYEN_CC_EXPIRY_DATE_IFRAME_XPATH}
    Wait Until Page Contains Element    locator=${ADYEN_CC_EXPIRY_DATE_INPUT}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${ADYEN_CC_EXPIRY_DATE_INPUT}
    Wait Until Element Is Enabled    locator=${ADYEN_CC_EXPIRY_DATE_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${ADYEN_CC_EXPIRY_DATE_INPUT}    text=${ADYEN_CC_EXPIRY_DATE}
    Unselect Frame

    Select Frame    locator=${ADYEN_CC_SECURITY_CODE_IFRAME_XPATH}
    Wait Until Page Contains Element    locator=${ADYEN_CC_SECURITY_CODE_INPUT}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${ADYEN_CC_SECURITY_CODE_INPUT}
    Wait Until Element Is Enabled    locator=${ADYEN_CC_SECURITY_CODE_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${ADYEN_CC_SECURITY_CODE_INPUT}    text=${ADYEN_CC_SECURITY_CODE}
    Unselect Frame

    Scroll Element Into View    locator=${ADYEN_CC_NAME_ON_CARD_INPUT}
    Wait Until Element Is Enabled    locator=${ADYEN_CC_NAME_ON_CARD_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${ADYEN_CC_NAME_ON_CARD_INPUT}    text=${ADYEN_CC_NAME_ON_CARD}

Click Pay Button
    [Documentation]    Click pay button in checkout page
    Wait Until Page Contains Element    locator=${ADYEN_CC_PAY_BUTTON}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${ADYEN_CC_PAY_BUTTON}
    Wait Until Element Is Enabled    locator=${ADYEN_CC_PAY_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${ADYEN_CC_PAY_BUTTON}
    Wait Until Element Is Not Visible    locator=${ADYEN_CC_PAY_BUTTON}    timeout=${TIMEOUT_LONG}

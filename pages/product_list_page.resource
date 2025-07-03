*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ../resources/locators/product_list_page_locator.resource
Variables       ../resources/data/testdata.py


*** Keywords ***
Click Product Card
    [Documentation]    Click product card in product list
    ${product_name}    Get Text    locator=${PRODUCT_CARD_NAME}
    Wait Until Element Is Enabled    locator=${PRODUCT_CARD}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${PRODUCT_CARD}
    Wait Until Element Is Visible    locator=${PRODUCT_CARD_NAME}    timeout=${TIMEOUT_LONG}
    RETURN    ${product_name}

Validate Product Name
    [Documentation]    Validate product name in product detail page with product name in product list
    [Arguments]    ${product_name}
    ${pdp_product_name}    Get Text    locator=${PRODUCT_NAME}
    ${product_name}    String.Convert To Lower Case    string=${product_name}
    ${pdp_product_name}    String.Convert To Lower Case    string=${pdp_product_name}
    Should Be Equal As Strings    ${product_name}    ${pdp_product_name}

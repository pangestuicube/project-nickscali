*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ../resources/locators/product_list_page_locator.resource
Variables       ../resources/data/testdata.py


*** Keywords ***
Click Product Card
    [Documentation]    Click product card in product list
    Wait Until Page Contains Element    locator=${PRODUCT_CARD_NAME}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${PRODUCT_CARD_NAME}
    ${product_name}    Get Text    locator=${PRODUCT_CARD_NAME}
    Wait Until Element Is Enabled    locator=${PRODUCT_CARD}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${PRODUCT_CARD}
    Wait Until Element Is Not Visible    locator=${PRODUCT_CARD}    timeout=${TIMEOUT_LONG}
    RETURN    ${product_name}

Validate Search Result
    [Documentation]    Validate product name in product detail page with product name in product list
    [Arguments]    ${search_keyword}
    Wait Until Page Contains Element    locator=${PRODUCT_CARD_NAME}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${PRODUCT_CARD_NAME}
    ${pdp_product_name}    Get Text    locator=${PRODUCT_CARD_NAME}
    ${search_keyword_lower}    Convert To Lowercase    ${search_keyword}
    ${pdp_product_name_lower}    Convert To Lowercase    ${pdp_product_name}
    Should Contain    ${pdp_product_name_lower}    ${search_keyword_lower}

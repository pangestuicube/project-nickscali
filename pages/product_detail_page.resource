*** Settings ***
Documentation       This file contains keywords for product detail page

Library             String
Library             SeleniumLibrary
Resource            ../resources/locators/product_detail_page_locator.resource
Resource            ../resources/locators/shopping_cart_locator.resource
Variables           ../resources/data/testdata.py


*** Keywords ***
Validate PDP Product Name
    [Documentation]    Validate product name in product detail page with product name in product list
    [Arguments]    ${plp_product_name}
    ${get_pdp_product_name}    Get PDP Product Name
    ${plp_product_name}    String.Convert To Lower Case    string=${plp_product_name}
    ${pdp_product_name}    String.Convert To Lower Case    string=${get_pdp_product_name}
    Should Be Equal As Strings    ${plp_product_name}    ${pdp_product_name}
    RETURN    ${pdp_product_name}

Get PDP Product Name
    [Documentation]    Get product name in product detail page
    Wait Until Page Contains Element    locator=${PRODUCT_NAME}    timeout=${TIMEOUT_LONG}
    ${pdp_product_name}    Get Text    locator=${PRODUCT_NAME}
    RETURN    ${pdp_product_name}

Check Available Delivery
    [Documentation]    Check available delivery in product detail page with Postcode or Suburb
    Scroll Element Into View    locator=${SUBURB_INPUT}
    Wait Until Element Is Enabled    locator=${SUBURB_INPUT}    timeout=${TIMEOUT_LONG}
    Input Text    locator=${SUBURB_INPUT}    text=${SUBURB_WITH_POSTCODE}
    Wait Until Element Is Visible    locator=${SUBURB_LIST_FIRST_OPTION}    timeout=${TIMEOUT_LONG}
    Wait Until Element Is Enabled    locator=${SUBURB_LIST_FIRST_OPTION}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${SUBURB_LIST_FIRST_OPTION}
    Wait Until Element Is Visible    locator=${AVAILABLE_DELIVERY_MESSAGE}    timeout=${TIMEOUT_LONG}

ADD TO BAG
    [Documentation]    Add product to shopping bag
    Scroll Element Into View    locator=${ADD_TO_BAG_BUTTON}
    Wait Until Element Is Enabled    locator=${ADD_TO_BAG_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${ADD_TO_BAG_BUTTON}
    Wait Until Element Is Not Visible    locator=${ADD_TO_BAG_BUTTON}    timeout=${TIMEOUT_LONG}

Get Product PDP Total Price
    [Documentation]    Get product total price in product detail page
    Wait Until Page Contains Element    locator=${PRODUCT_TOTAL_PRICE}    timeout=${TIMEOUT_LONG}
    Scroll Element Into View    locator=${PRODUCT_TOTAL_PRICE}
    ${pdp_product_total_price}    Get Text    locator=${PRODUCT_TOTAL_PRICE}
    RETURN    ${pdp_product_total_price}

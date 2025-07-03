*** Settings ***
Library         String
Library         SeleniumLibrary
Resource        ../resources/locators/product_detail_page_locator.resource
Resource        ../resources/locators/shoping_cart_locator.resource
Variables       ../resources/data/testdata.py


*** Keywords ***
Validate Product Name
    [Documentation]    Validate product name in product detail page with product name in product list
    [Arguments]    ${plp_product_name}
    ${pdp_product_name}    Get Text    locator=${PRODUCT_NAME}
    ${plp_product_name}    String.Convert To Lower Case    string=${plp_product_name}
    ${pdp_product_name}    String.Convert To Lower Case    string=${pdp_product_name}
    Should Be Equal As Strings    ${plp_product_name}    ${pdp_product_name}

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
    [Arguments]    ${base_product_name}
    Scroll Element Into View    locator=${ADD_TO_BAG_BUTTON}
    Wait Until Element Is Enabled    locator=${ADD_TO_BAG_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${ADD_TO_BAG_BUTTON}
    Wait Until Element Is Visible    locator=${CHECKOUT_BUTTON}    timeout=${TIMEOUT_LONG}
    ${Shoping_Cart_Product_Name}    Get Text    locator=${SC_PRODUCT_NAME}
    ${Shoping_Cart_Product_Name}    String.Convert To Lower Case    ${Shoping_Cart_Product_Name}
    ${base_product_name}    String.Convert To Lower Case    string=${base_product_name}
    Should Be Equal As Strings    ${Shoping_Cart_Product_Name}    ${base_product_name}

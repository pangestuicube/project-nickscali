*** Settings ***
Library         String
Library         SeleniumLibrary
Resource        ../resources/locators/shoping_cart_locator.resource
Variables       ../resources/data/testdata.py


*** Keywords ***
Click On Checkout
    [Documentation]    Click on checkout button in shoping cart page
    ${ORDER_TOTAL}    Get Shopping Cart Order Total
    Wait Until Element Is Enabled    locator=${CHECKOUT_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${CHECKOUT_BUTTON}
    Wait Until Element Is Not Visible    locator=${CHECKOUT_BUTTON}    timeout=${TIMEOUT_LONG}
    RETURN    ${ORDER_TOTAL}

Validate Product Name
    [Documentation]    Validate product name in product detail page with product name in product detail page
    [Arguments]    ${base_product_name}
    ${Shoping_Cart_Product_Name}    Get Text    locator=${SC_PRODUCT_NAME}
    ${Shoping_Cart_Product_Name}    String.Convert To Lower Case    ${Shoping_Cart_Product_Name}
    ${base_product_name}    String.Convert To Lower Case    string=${base_product_name}
    Should Be Equal As Strings    ${Shoping_Cart_Product_Name}    ${base_product_name}

Get Shopping Cart Order Total
    [Documentation]    Get shopping cart order total
    Wait Until Element Is Visible    locator=${SC_ORDER_TOTAL}    timeout=${TIMEOUT_LONG}
    ${Shopping_Cart_Order_Total}    Get Text    locator=${SC_ORDER_TOTAL}
    RETURN    ${Shopping_Cart_Order_Total}

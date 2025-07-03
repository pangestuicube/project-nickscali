*** Settings ***
Library     String
Library     SeleniumLibrary
Resource    ../base/base.resource
Resource    ../resources/locators/shopping_cart_locator.resource


*** Keywords ***
Click On Checkout
    [Documentation]    Click on checkout button in shoping cart page
    ${ORDER_TOTAL}    Get Shopping Cart Order Total
    Wait Until Element Is Enabled    locator=${CHECKOUT_BUTTON}    timeout=${TIMEOUT_LONG}
    Click Element    locator=${CHECKOUT_BUTTON}
    Wait Until Element Is Not Visible    locator=${CHECKOUT_BUTTON}    timeout=${TIMEOUT_LONG}
    RETURN    ${ORDER_TOTAL}

Validate Shopping Cart Product Name
    [Documentation]    Validate product name in product detail page with product name in product detail page
    [Arguments]    ${pdp_product_name}
    ${get_sc_product_name}    Get Shopping Cart Product Name
    ${sc_product_name}    String.Convert To Lower Case    ${get_sc_product_name}
    ${pdp_product_name}    String.Convert To Lower Case    ${pdp_product_name}
    Should Be Equal As Strings    ${sc_product_name}    ${pdp_product_name}

Validate Shopping Cart Product Price
    [Documentation]    Validate product price in product detail page with product price in product detail page
    [Arguments]    ${pdp_product_price}
    ${get_sc_price}    Get Shopping Cart Order Total
    ${sc_product_price}    base.Normalize Price Value    price_value=${get_sc_price}
    ${pdp_product_price}    base.Normalize Price Value    price_value=${pdp_product_price}
    Should Be Equal As Strings    ${sc_product_price}    ${pdp_product_price}

Get Shopping Cart Order Total
    [Documentation]    Get shopping cart order total
    Wait Until Element Is Visible    locator=${SC_ORDER_TOTAL_TXT}    timeout=${TIMEOUT_LONG}
    ${Shopping_Cart_Order_Total}    Get Text    locator=${SC_ORDER_TOTAL_TXT}
    RETURN    ${Shopping_Cart_Order_Total}

Get Shopping Cart Product Name
    [Documentation]    Get shopping cart product name
    Wait Until Element Is Visible    locator=${SC_PRODUCT_NAME_TXT}    timeout=${TIMEOUT_LONG}
    ${Shopping_Cart_Product_Name}    Get Text    locator=${SC_PRODUCT_NAME_TXT}
    RETURN    ${Shopping_Cart_Product_Name}

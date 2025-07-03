*** Settings ***
Documentation       This file contains test cases for checkout

Library             SeleniumLibrary
Resource            ../pages/shopping_cart_page.resource
Resource            ../pages/product_list_page.resource
Resource            ../pages/product_detail_page.resource
Resource            ../pages/homepage.resource
Variables           ../resources/data/testdata.py
Resource            ../base/base.resource
Resource            ../setup/setup.resource
Resource            ../pages/checkout_page.resource

Test Setup          setup.Start Test Case
# Test Teardown    setup.End Test


*** Test Cases ***
Guest Checkout - Successful Purchase Using Credit Card
    [Documentation]    Guest Checkout - Successful Purchase Using Credit Card
    homepage.Fill Search Box    keyword=${SEARCH_PRODUCT_KEYWORD}
    product_list_page.Validate Search Result    search_keyword=${SEARCH_PRODUCT_KEYWORD}
    ${plp_product_name}    product_list_page.Click Product Card
    ${pdp_product_name}    product_detail_page.Validate PDP Product Name    plp_product_name=${plp_product_name}
    product_detail_page.Check Available Delivery
    ${pdp_product_total_price}    product_detail_page.Get Product PDP Total Price
    product_detail_page.ADD TO BAG
    shopping_cart_page.Validate Shopping Cart Product Name    pdp_product_name=${pdp_product_name}
    shopping_cart_page.Validate Shopping Cart Product Price    pdp_product_price=${pdp_product_total_price}
    shopping_cart_page.Click On Checkout
    checkout_page.Input User Email    email=${GUEST_EMAIL}
    checkout_page.Input Delivery Address
    checkout_page.Click Next Review Button
    checkout_page.Check Terms And Conditions Checkbox
    checkout_page.Click Next Payment Button
    checkout_page.Select Adyen Credit Card Payment Method

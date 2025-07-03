*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/locators/checkout_page_locator.resource
Resource            ../pages/homepage.resource
Variables           ../resources/data/testdata.py
Resource            ../base/base.resource
Resource            ../setup/setup.resource

Test Setup          setup.Start Test Case
Test Teardown       setup.End Test


*** Test Cases ***
Guest Checkout - Successful Purchase Using Credit Card
    [Documentation]    Guest Checkout - Successful Purchase Using Credit Card
    homepage.Fill Search Box    keyword==${SEARCH_PRODUCT_KEYWORD}
    

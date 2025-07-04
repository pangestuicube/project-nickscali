*** Settings ***
Documentation       This file contains keywords for product list page

Library             Collections
Library             String
Library             SeleniumLibrary
Resource            ../resources/locators/product_list_page_locator.resource
Variables           ../resources/data/testdata.py


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
    ${keywod}    Convert To Lower Case    ${search_keyword}
    @{product_names}    Get All PLP Product Names
    FOR    ${product_name}    IN    @{product_names}
        ${product_name_lower}    Convert To Lowercase    ${product_name}
        Should Contain    ${product_name_lower}    ${keywod}
    END

Get All PLP Product Names
    [Documentation]    Get All product name in product list page
    Wait Until Page Contains Element    locator=${PRODUCT_CARD_NAME}    timeout=${TIMEOUT_LONG}
    ${total_result}    Get Element Count    locator=${PRODUCT_CARD_NAME}
    ${search_result_list}    Create List
    FOR    ${item}    IN RANGE    1    ${total_result}
        Scroll Element Into View    ${PRODUCT_CARD_NAME_INDEX.format(${item})}
        ${plp_product_item_name}    Get Text    ${PRODUCT_CARD_NAME_INDEX.format(${item})}
        Append To List    ${search_result_list}    ${plp_product_item_name}
    END
    RETURN    ${search_result_list}

# Get All PLP Product Names
#    [Documentation]    Get All product name in product list page
#    Wait Until Page Contains Element    locator=${PRODUCT_CARD_NAME}    timeout=${TIMEOUT_LONG}
#    ${product_name_elements}    Get WebElements    locator=${PRODUCT_CARD_NAME}
#    ${product_names_list}    Create List
#    FOR    ${element}    IN    @{product_name_elements}
#    ${product_name}    Get Text    ${element}
#    Append To List    ${product_names_list}    ${product_name}
#    END
#    RETURN    ${product_names_list}

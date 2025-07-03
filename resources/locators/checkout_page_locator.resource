*** Settings ***
Documentation       This file contains locators for checkout page


*** Variables ***
# https://prnt.sc/b3uraownZyBC
${EMAIL_INPUT}                          //input[@name='email']
# https://prnt.sc/qLzYBBwwAUnm
${NEXT_BUTTON}                          //button[normalize-space()='Next']
# https://prnt.sc/2NegggYIMkxl
${FIRST_NAME_INPUT}                     //input[@name='firstName']
# https://prnt.sc/jY8z_ZCAinPJ
${LAST_NAME_INPUT}                      //input[@name='lastName']
# https://prnt.sc/eNB4jYIleCQA
${MOBILE_PHONE_NUMBER_INPUT}            //label[text()='Mobile phone number']/following-sibling::div/input
# https://prnt.sc/WOXYqCLCHDHp
${STREET_ADDRESS_INPUT}                 //input[@name='shippingAddress.street']
# https://prnt.sc/FSF8fmz6ibN1
${ADDITIONAL_ADDRESS INFO_INPUT}        //input[@name='shippingAddress.additionalAddress']
# https://prnt.sc/Wg7pptCvleLn
${SUBURB_INPUT}                         //input[@name='shippingAddress.suburb']
# https://prnt.sc/lGYCaxIV_qy7
${POSTCODE_INPUT}                       //input[@name='shippingAddress.postcode']
# https://prnt.sc/6-r9wYeGF1qp
${STATE_INPUT}                          //button[@role='combobox']
# https://prnt.sc/nKbT_paL59vy
${NEXT_REVIEW_BUTTON}                   //button[normalize-space()='Next: Review']
# https://prnt.sc/3Ij_gFJBPXF_
${ADDRESS_LIST_OPTION}                  //div[@class='pac-container pac-logo hdpi']//div[1]
# https://prnt.sc/1RTMsj4YvmQs
${TERMS_AND_CONDITIONS_CHECKBOX_1}      //div[contains(., 'That my purchase is')]/preceding-sibling::button[@role='checkbox']
# https://prnt.sc/PMT0Upn2EsPO
${TERMS_AND_CONDITIONS_CHECKBOX_2}      //div[contains(., 'I have read the')]/preceding-sibling::button[@role='checkbox']
# https://prnt.sc/f5R2lmrf-Aif
${TERMS_AND_CONDITIONS_CHECKBOX_3}      //div[contains(., 'To be bound by these additional')]/preceding-sibling::button[@role='checkbox']
# https://prnt.sc/NWkPvH2uORwh
${NEXT_PAYMENT_BUTTON}                  //button[normalize-space()='Next: Payment']
# https://prnt.sc/rpCzkgmrhNYQ
${ADYEN_CREDIT_CARD_PAYMENT_METHOD}     //button[@value='adyen_cc']

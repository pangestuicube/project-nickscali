*** Settings ***
Documentation       This file contains locators for shopping cart page


*** Variables ***
# https://prnt.sc/8Y_KwRemz18Y
${CHECKOUT_BUTTON}          (//button[text()='Checkout'])[1]
# https://prnt.sc/S2TDUQa9DsP5
${SC_PRODUCT_NAME_TXT}      //ul[@class='divide-y divide-txt_light']/li[1]//h4
# https://prnt.sc/dgZUkBejIpOO
${SC_ORDER_TOTAL_TXT}       //span[text()='Order total']/following-sibling::span

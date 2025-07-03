*** Variables ***
# https://prnt.sc/-vlJ_k9Qsr6K
${SUBURB_INPUT}                     //input[@placeholder='Enter postcode or suburb']
# https://prnt.sc/hEm3zue8LkDR
${SUBURB_LIST_FIRST_OPTION}         //input[@placeholder='Enter postcode or suburb']/following-sibling::ul/li[1]
# https://prnt.sc/44LkPcuvfROv
${PRODUCT_NAME}                     //div[contains(@class,'hidden border-b')]//h1
# https://prnt.sc/IEehnNC5c0b6
${UNABLE_DELIVERY_MESSAGE}          //div[@class='undelivery-message']
# https://prnt.sc/p76XZOR1WFEg
${AVAILABLE_DELIVERY_MESSAGE}       //li[contains(., 'Delivery fee calculated at checkout')]
# https://prnt.sc/E-p2iBc_4STO
${ADD_TO_BAG_BUTTON}                //button[normalize-space()='Add to bag']
# https://prnt.sc/trlCHXaf4HAG
${PRODUCT_TOTAL_PRICE}              //div[div[@class='ct-text-small-2 lg:ct-text-5 font-bold' and text()='Total']]/div[@class='ct-text-1 font-bold']

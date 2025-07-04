*** Settings ***
Documentation       This file contains keywords for setup webdriver and browser

Library             Collections
Library             OperatingSystem
Library             String
Library             SeleniumLibrary
Resource            ../base/base.resource


*** Variables ***
${BROWSER}              Chrome
${isHeadless}           ${EMPTY}

${ChromeDriverPath}     D:/Icube/QA/Otomation/Drivers/chromedriver-linux64/chromedriver
${EdgeDriverPath}       D:/Icube/QA/Otomation/Drivers/edgedriver_linux64/msedgedriver


*** Keywords ***
Start Test Case
    ${OS}    Evaluate    platform.system()    platform
    Log To Console    "running on ${OS}-${BROWSER}"
    Log    "running on ${OS}-${BROWSER}"
    @{Browser_id}    Get Browser Ids
    IF    @{Browser_id}==[]    Start Test

Start Test
    Setup WebDriver
    Setup Browser

Setup WebDriver
    ${OS}    Evaluate    platform.system()    platform
    ${ExecutablePath}    Setup WebDriver ExecutablePath    ${OS}
    Create WebDriver with Config    ${ExecutablePath}

Setup Browser
    Maximize Browser Window
    Go to    ${BASE_URL}
    Execute JavaScript    document.body.style.zoom = "100%"
    Set selenium speed    0.3

Setup WebDriver ExecutablePath
    [Arguments]    ${OS}
    IF    '${BROWSER}'=='Safari'
        RETURN    ${False}
    ELSE IF    '${BROWSER}'=='Chrome'
        ${ExecutablePath}    Set Variable    ${ChromeDriverPath}
    ELSE IF    '${BROWSER}'=='Edge'
        ${ExecutablePath}    Set Variable    ${EdgeDriverPath}
    END
    IF    '${OS}'=="Windows"
        ${isContainExe}    Check Driver Path Contains Exe Extension    ${ExecutablePath}
        IF    not ${isContainExe}
            ${ExecutablePath}    Set Variable    ${ExecutablePath}.exe
        END
    END
    ${ExecutablePath}    Replace String    ${ExecutablePath}    \\    /
    RETURN    ${ExecutablePath}

Check Driver Path Contains Exe Extension
    [Arguments]    ${ExecutablePath}
    ${last4Chars}    Set Variable    ${ExecutablePath[-4:]}
    ${isContainExe}    Run Keyword And Return Status    Should Be Equal As Strings    ${last4Chars}    .exe
    RETURN    ${isContainExe}

Create WebDriver with Config
    [Arguments]    ${ExecutablePath}
    IF    '${BROWSER}'=='Safari'
        Create WebDriver    ${BROWSER}
    ELSE
        ${options}    Setup Browser Options Configuration
        ${service}    Setup Browser Service Configuration    ${ExecutablePath}
        Create WebDriver    ${BROWSER}    options=${options}    service=${service}
    END

Setup Browser Options Configuration
    ${options}    Evaluate    sys.modules['selenium.webdriver'].${BROWSER}Options()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    window-size\=1920,1080
    IF    bool('${isHeadless}')
        Call Method    ${options}    add_argument    headless
    END
    ${options.prefs}    Create Dictionary    profile.default_content_setting_values.geolocation    1
    Call Method    ${options}    add_experimental_option    prefs    ${options.prefs}
    RETURN    ${options}

Setup Browser Service Configuration
    [Arguments]    ${ExecutablePath}
    ${browserLower}    Convert To Lower Case    ${BROWSER}
    ${service}    Evaluate
    ...    sys.modules['selenium.webdriver.${browserLower}.service'].Service('${ExecutablePath}')
    ...    sys, selenium
    RETURN    ${service}

End Test Case
    Go To Home Page
    Delete All Cookies
    Execute Javascript    window.localStorage.clear();
    Execute Javascript    window.sessionStorage.clear();

End Test
    Close All Browsers

*** Settings ***
Documentation  demoapp saucelabs application shopping module test using AppiumLibrary
Library  AppiumLibrary


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.1}
${ARTICLE_BACKPACK}    xpath=(//android.view.ViewGroup[@content-desc="store item"])[1]/android.view.ViewGroup[1]/android.widget.ImageView                   
${COLOR_GREY_BUTTON}    xpath=//android.view.ViewGroup[@content-desc="gray circle"]/android.view.ViewGroup
${ADD_TO_CART_BUTTON}    accessibility_id=Add To Cart button
${CART_BADGE}    xpath=//android.view.ViewGroup[@content-desc="cart badge"]/android.widget.ImageView
${PROCEED_TO_CHECKOUT_BUTTON}    xpath=//android.view.ViewGroup[@content-desc="Proceed To Checkout button"]
${BOB_LOGIN_AUTO}    xpath=//android.view.ViewGroup[@content-desc="bob@example.com-autofill"]/android.widget.TextView
${LOGIN_BUTTON}    accessibility_id=Login button
${FULL_NAME_FIELD}    accessibility_id=Full Name* input field
${ADRESS_FIELD}    accessibility_id=Address Line 1* input field
${CITY_FIELD}    accessibility_id=City* input field
${ZIP_CODE_FIELD}    accessibility_id=Zip Code* input field
${COUNTRY_FIELD}    accessibility_id=Country* input field
${PAYEMENT_BUTTON}    accessibility_id=To Payment button
${CHECKOUT_PAGE}    xpath=//android.view.ViewGroup[@content-desc="container header"]/android.widget.TextView
${REMOVE_ITEM_BUTTON}    xpath=//android.view.ViewGroup[@content-desc="remove item"]/android.widget.TextView
${NO_ITEM_CHECK}    xpath=//android.view.ViewGroup[@content-desc="container header"]/android.widget.TextView
${ITEM_Check}    xpath=//android.widget.TextView[@content-desc="product label"]    


*** Test Cases ***
Select An Article, Add To Cart And Remove It
  Open Test Application
  Select An Article And Color
  Add To Cart Article And Proceed To Checkout
  Login Account And Payement
  Remove Item

*** Keywords ***
Open Test Application
  Open Application  http://192.168.0.229:4724/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=TOTO    appPackage=com.saucelabs.mydemoapp.rn  appActivity=.MainActivity t29

Select An Article And Color
    Click Element    ${ARTICLE_BACKPACK}    
    Wait Until Page Contains Element    ${COLOR_GREY_BUTTON}
    Click Element    ${COLOR_GREY_BUTTON}
    Swipe By Percent	90	90	90	10	
   
Add To Cart Article And Proceed To Checkout
    Wait Until Page Contains Element    xpath=//android.widget.ScrollView[@content-desc="product screen"]/android.view.ViewGroup/android.widget.TextView[2]
    Click Element    ${ADD_TO_CART_BUTTON}
    Click Element    ${CART_BADGE}
    Wait Until Page Contains Element    ${ITEM_Check}        
    ${verif1}    AppiumLibrary.Get Text    ${ITEM_Check}
    Should Be Equal    ${verif1}    Sauce Labs Backpack
    Click Element     ${PROCEED_TO_CHECKOUT_BUTTON}
Login Account And Payement
    Wait Until Page Contains Element    ${BOB_LOGIN_AUTO}
    Click Element    ${BOB_LOGIN_AUTO}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${FULL_NAME_FIELD}
    Click Element    ${FULL_NAME_FIELD}
    Input Text    ${FULL_NAME_FIELD}    Rebecca
    Hide Keyboard
    Click Element    ${ADRESS_FIELD}
    Input Text    ${ADRESS_FIELD}    Mandorley 112
    Hide Keyboard   
    Click Element    ${CITY_FIELD}
    Input Text    ${CITY_FIELD}    Truro
    Hide Keyboard
    Click Element    ${ZIP_CODE_FIELD}
    Input Text    ${ZIP_CODE_FIELD}    89750
    Hide Keyboard
    Click Element    ${COUNTRY_FIELD}
    Input Text    ${COUNTRY_FIELD}    United Kingdom
    Click Element    ${PAYEMENT_BUTTON}
    Wait Until Page Contains Element    ${CHECKOUT_PAGE}
    ${verif2}    Get Text    ${CHECKOUT_PAGE}
    Should Be Equal    ${verif2}    Checkout

Remove Item
  Click Element    ${CART_BADGE}
  Wait Until Page Contains Element    ${REMOVE_ITEM_BUTTON}
  Click Element    ${REMOVE_ITEM_BUTTON}
  ${verif3}    Get Text    ${NO_ITEM_CHECK}
    Should Be Equal    ${verif3}    No Items
    Close Application
    




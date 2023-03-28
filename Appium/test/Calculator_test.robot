*** Settings ***
Documentation  Calculator native application test using AppiumLibrary
Library  AppiumLibrary


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.1}
${DIGIT_8}    id=com.android.calculator2:id/digit_8
${DIGIT_5}    id=com.android.calculator2:id/digit_5
${PLUS_BUTTON}    id=com.android.calculator2:id/op_add
${EQUAL_BUTTON}    id=com.android.calculator2:id/eq
${CLEAR_BUTTON}    id=com.android.calculator2:id/clr
${RESULTAT}    id=com.android.calculator2:id/result                    

*** Test Cases ***
Operation with calcultor
  Open Test Application
  Addition

*** Keywords ***
Open Test Application
  Open Application  http://192.168.0.229:4724/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=TOTO   appPackage=com.android.calculator2  appActivity=.Calculator t7

Addition
    Click Element    ${DIGIT_8}    
    Click Element    ${PLUS_BUTTON}
    Click Element    ${DIGIT_5}
    Click Element     ${EQUAL_BUTTON}
    Wait Until Page Contains Element    ${RESULTAT}
    ${verif1}    AppiumLibrary.Get Text    ${RESULTAT}
    Should Be Equal    ${verif1}    13
    Click Element     ${CLEAR_BUTTON}
    ${verif2}    AppiumLibrary.Get Text    ${RESULTAT}
    Should Be Empty    ${verif2}
    Close Application     
    




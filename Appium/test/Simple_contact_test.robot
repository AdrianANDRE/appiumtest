*** Settings ***
Documentation  Simple contact application test AppiumLibrary
Library  AppiumLibrary


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/demoapp/Simple_Contacts_v4.5.0_apkpure.com.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.1}
${ALLOW_BUTTON}    id=com.android.packageinstaller:id/permission_allow_button
${ADD_CONTACT_BUTTON}    id=com.simplemobiletools.contacts:id/fragment_fab
${FIRST_NAME_FIELD}    id=com.simplemobiletools.contacts:id/contact_first_name
${LAST_NAME_FIELD}    id=com.simplemobiletools.contacts:id/contact_surname    
${NUMBER_FIELD}    id=com.simplemobiletools.contacts:id/contact_number    
${MAIL_FIELD}    id=com.simplemobiletools.contacts:id/contact_email
${SAVE_BUTTON}    com.simplemobiletools.contacts:id/save
${CONTACT_CREATED}    id=com.simplemobiletools.contacts:id/contact_name
${MORE_OPTIONS_BUTTON}    //android.widget.ImageView[@content-desc="More options"]
${DELETE_BUTTON}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.LinearLayout[2]/android.widget.RelativeLayout/android.widget.TextView
${CONFIRMATION_BUTTON}    id=android:id/button1

*** Test Cases ***
Should Add Contact In Simple Contact App
  Open Test Application
  Input Contact And Delete


*** Keywords ***
Open Test Application
  Open Application   http://192.168.0.229:4724/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=TOTO    appPackage=com.simplemobiletools.contacts  appActivity=.activities.MainActivity t17

Input Contact And Delete
    Click Element    ${ALLOW_BUTTON}
    Wait Until Page Contains Element    ${ALLOW_BUTTON}    
    Click Element    ${ALLOW_BUTTON}
    Wait Until Page Contains Element    ${ADD_CONTACT_BUTTON}
    Click Element    ${ADD_CONTACT_BUTTON}
    Wait Until Page Contains Element    ${FIRST_NAME_FIELD}
    Click Element    ${FIRST_NAME_FIELD}
    Input Text    ${FIRST_NAME_FIELD}    Ségolène+
    ${verif1}    AppiumLibrary.Get Text    ${FIRST_NAME_FIELD}
    Should Be Equal    ${verif1}    Ségolène+
    Wait Until Page Contains Element    ${LAST_NAME_FIELD}
    Click Element    ${LAST_NAME_FIELD}
    Input Text    ${LAST_NAME_FIELD}    Froreza1&
    ${verif2}    AppiumLibrary.Get Text    ${LAST_NAME_FIELD}
    Should Be Equal    ${verif2}    Froreza1&
    Wait Until Page Contains Element    ${NUMBER_FIELD}
    Click Element    ${NUMBER_FIELD}
    Input Text    ${NUMBER_FIELD}    0656453421    
    ${verif3}    AppiumLibrary.Get Text    ${NUMBER_FIELD}
    Should Be Equal    ${verif3}    0656453421
    Wait Until Page Contains Element    ${MAIL_FIELD}
    Click Element    ${MAIL_FIELD}
    Input Text    ${MAIL_FIELD}    gr@fret.com    
    ${verif4}    AppiumLibrary.Get Text    ${MAIL_FIELD}
    Should Be Equal    ${verif4}    gr@fret.com    
    Wait Until Page Contains Element    ${SAVE_BUTTON}
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains Element    ${CONTACT_CREATED}
    Click Element    ${CONTACT_CREATED}
    Wait Until Page Contains Element    ${MORE_OPTIONS_BUTTON}
    Click Element    ${MORE_OPTIONS_BUTTON}
    Wait Until Page Contains Element    ${DELETE_BUTTON}
    Click Element    ${DELETE_BUTTON}
    Wait Until Page Contains Element    ${CONFIRMATION_BUTTON}
    Click Element    ${CONFIRMATION_BUTTON}
    Close Application     
        




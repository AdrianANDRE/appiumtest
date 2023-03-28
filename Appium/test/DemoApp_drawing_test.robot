*** Settings ***
Documentation  demoapp saucelabs application drawing module and photo native application test using AppiumLibrary
Library  AppiumLibrary


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.1}
${MENU_BUTTON}    xpath=//android.view.ViewGroup[@content-desc="open menu"]/android.widget.ImageView
${DRAWING_ITEM}    xpath=//android.view.ViewGroup[@content-desc="menu item drawing"]/android.widget.TextView
${DRAWING_TITLE}    xpath=//android.view.ViewGroup[@content-desc="container header"]/android.widget.TextView
${SAVE_BUTTON}    xpath=//android.view.ViewGroup[@content-desc="Save button"]
${ALLOW_BUTTON}    id=com.android.packageinstaller:id/permission_allow_button
${OK_BUTTON}    id=android:id/button1
${SWITCH_BUTTON}    id=com.google.android.apps.photos:id/auto_backup_switch
${TOUCH_SCREEN}    id=com.google.android.apps.photos:id/touch_outside
${KEEP_OFF_BUTTON}    id=android:id/button2
${PHOTO_TO_DELETE}    xpath=//android.view.ViewGroup[contains(@content-desc,"Photo taken on ")]
${DELETE_BUTTON}    accessibility_id=Trash
${DELETE_ALLOW_BUTTON}    id=android:id/button1
${NO_PHOTOS_CHECK}    id=com.google.android.apps.photos:id/empty_page_caption

*** Test Cases ***
Select Drawing Menu, Draw A Rectangle, Save The Drawing, Go To Files App And Delete The Drawing
  Open Test Application
  Select Drawing Menu
  Draw A Rectangle
  Save The Drawing
  Close The Test Aplication And Open Photos
  Remove The Picture

*** Keywords ***
Open Test Application
  Open Application  http://192.168.0.229:4724/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=TOTO    appPackage=com.saucelabs.mydemoapp.rn  appActivity=.MainActivity t29
Select Drawing Menu
    Click Element    ${MENU_BUTTON}     
    Wait Until Page Contains Element    ${DRAWING_ITEM}
    Click Element    ${DRAWING_ITEM}    
    Wait Until Page Contains Element    ${DRAWING_TITLE}
Draw A Rectangle
    Sleep    3      
    Swipe By Percent	60	80	60	40
    Swipe By Percent	60	40	20	40
    Swipe By Percent	20	40	20	80
    Swipe By Percent	20	80	60	80
Save The Drawing
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains Element    ${ALLOW_BUTTON}
    Click Element    ${ALLOW_BUTTON}
    Wait Until Page Contains Element    ${OK_BUTTON}
    Click Element    ${OK_BUTTON}
Close The Test Aplication And Open Photos
    Close Application
    Open Application  http://192.168.0.229:4724/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=TOTO    appPackage=com.google.android.apps.photos  appActivity=.home.HomeActivity t32
    Wait Until Page Contains Element    ${SWITCH_BUTTON}
    Click Element    ${SWITCH_BUTTON}
    Click Element    ${TOUCH_SCREEN}
    Wait Until Page Contains Element    ${KEEP_OFF_BUTTON}
    Click Element    ${KEEP_OFF_BUTTON}
 Remove The Picture
    Wait Until Page Contains Element    ${PHOTO_TO_DELETE}
    Click Element    ${PHOTO_TO_DELETE}
    Wait Until Page Contains Element    ${DELETE_BUTTON}
    Click Element    ${DELETE_BUTTON}
    Wait Until Page Contains Element    ${DELETE_ALLOW_BUTTON}
    Click Element    ${DELETE_ALLOW_BUTTON}
    Wait Until Page Contains Element    ${NO_PHOTOS_CHECK}
    Close Application
        



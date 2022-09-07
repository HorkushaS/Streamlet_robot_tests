*** Settings ***
Library     SeleniumLibrary
Documentation    Suite desctiption #smoke tests for Streamlet website

*** Variables ***
${MAINPAGE URL}     https://dev.streamlet.tk
${SIGNIN URL}       https://dev.streamlet.tk/sign-in
${BROWSER}      Chrome
${SIGNINMPXP}     xpath=//*[text()='Sign In']
${MPLOGOXP}     xpath=//*/header/div[1]/div[1]
${AUHEADER}     xpath=//*/div/div/h1
${EMAILXP}      xpath=//*[@type='email']
${PASSWORDXP}       xpath=//*[@type='password']
${SIGNINAUXP}       xpath=//*[@type='submit']
${VIDEOCARDXP}      xpath=//a[contains(text(), 'Get over here')]
${VIDEOPLAYER}      xpath=//*/section/div[2]/div/div[1]
${USERDDMENUXP}     xpath=//*/header/div[2]/button[2]
${PROFILESETTINGSXP}        xpath=//*/div[2]/ul/li[1]
${PROFILESETTINGS}      xpath=//*[contains(text(), 'Change your personal information')]
${STARTSTREAMBTNXP}     xpath=//*/header/div[2]/a
${STUDIOHEADER}     xpath=//*[contains(text(), 'Welcome to Studio!')]
${STARTSTREAMSTUDIOXP}      xpath=//*[contains(text(), 'Start streaming')]
${STRKEYXP}     xpath=//*[contains(text(), 'Streaming key')]

*** Test Cases ***
Main page to login page
    Open Main page
    Click On The Sign In Button mp
    Assert Sign in page
    [Teardown]    Close Browser
Video page
    Open Main page
    Click on Video card
    Assert Video page
    [Teardown]    Close Browser
Login to the system
    Open Sign in page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Main page
    [Teardown]    Close Browser
Profile preferances
    Open Sign in page
    Type in email
    Type in password
    Click on the Sign in button
    Click user profile settings
    Assert profile settings
    [Teardown]    Close Browser
Studio app main page
    Open Sign in page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Start stream button
    Assert Studio header message
    [Teardown]    Close Browser
Stream settings
    Open Sign in page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Start stream button
    Click Start streaming
    Assert stream settings page
    [Teardown]    Close Browser

*** Keywords ***
Open Main page
    Open Browser        ${MAINPAGE URL}     ${BROWSER}
    Title Should be     Streamlet
Click on the Sign in button mp
    Click Element       ${SIGNINMPXP}
Click on the Sign in button
    Click Element       ${SIGNINAUXP}
Assert Sign in page
    Wait Until Element Contains     ${AUHEADER}     Sign in
    Capture Page Screenshot     alert.png
Assert Main page
    Wait Until Element Is Visible       ${MPLOGOXP}
    Capture Page Screenshot     alert.png
Click on Video card
    Wait Until Element Is Visible       ${VIDEOCARDXP}
    Click Element       ${VIDEOCARDXP}
Assert Video page
    Wait Until Element is Visible       ${VIDEOPLAYER}
    Capture Page Screenshot     alert.png
Open Sign in page
    Open Browser        ${SIGNIN URL}   ${BROWSER}
    Wait Until Element Contains     ${AUHEADER}     Sign in
Type in email
    Input text      ${EMAILXP}      mytest3@mailsac.com
Type in password
    Input text      ${PASSWORDXP}       12341234
Click user profile settings
    Wait Until Element is Visible       ${USERDDMENUXP}
    Click Element       ${USERDDMENUXP}
    Wait Until Element Is Visible       ${PROFILESETTINGSXP}
    Click Element       ${PROFILESETTINGSXP}
Assert profile settings
    Wait Until Element Contains     ${PROFILESETTINGS}    Change your personal information
    Capture Page Screenshot     alert.png
Click on the Start stream button
    Wait Until Element is Visible       ${STARTSTREAMBTNXP}
    Click Element       ${STARTSTREAMBTNXP}
Assert studio header message
    Wait Until Element Contains     ${STUDIOHEADER}     Welcome to Studio!
    Capture Page Screenshot     alert.png
Click Start streaming
    Click Element       ${STARTSTREAMSTUDIOXP}
Assert stream settings page
    Wait Until Element Contains     ${STRKEYXP}     Streaming key
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MAINPAGE URL}     https://streamlet.tk
${SIGNIN URL}       https://streamlet.tk/sign-in
${BROWSER}      Chrome
${SIGNINMPXP}     xpath=//*[text()='Sign In']
${MPLOGOXP}     xpath=//*/header/div[1]/div[1]
${AUHEADER}     xpath=//*/div/div/h1
${EMAILXP}      xpath=//*[@id=":r0:"]
${PASSWORDXP}       xpath=//*[@id=":r1:"]
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
${targetURL}        https://streamlet.tk/video/d77f6da7-73c4-4853-8671-1835710b3840
${chatinput}        xpath=//*[@id="main-content"]/div/div[3]/div[1]/div/div[3]/div[2]/input
${sendmessagebtn}       xpath=//*[@id="main-content"]/div/div[3]/div[1]/div/div[3]/div[2]/div/div[2]/button

*** Keywords ***
Open Main page
    Open Browser        ${MAINPAGE URL}     ${BROWSER}
    maximize browser window
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
    maximize browser window
    Wait Until Element Contains     ${AUHEADER}     Sign in
Type in email
    [Arguments]    ${email}
    Input text      ${EMAILXP}      ${email}
Type in password
    Input text      ${PASSWORDXP}       test1234
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
Close Browsers
    close all browsers
Open Stream page
    go to       ${targetURL}
Type in chat
    [Arguments]    ${chat}
    Wait Until Element is Visible       ${chatinput}
    Input text      ${chatinput}        ${chat}
    Click Element       ${sendmessagebtn}
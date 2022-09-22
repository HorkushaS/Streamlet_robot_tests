*** Settings ***
Library    SeleniumLibrary
Documentation    Suite desctiption #load tests for Streamlet website
Resource    ../variables/variables.robot
Library    DataDriver       ../TestData/emails.xlsx

Suite Teardown    Close Browsers
Test Template    Email

*** Test Cases ***
Sign in with ${email}
    Email

*** Keywords ***
Email
    [Arguments]     ${email}    ${chat}
    Open Sign in page
    Type in email       ${email}
    Type in password
    Click on the Sign in button
    Wait until page contains     Recommended for you
    Open Stream page
    Type in chat        ${chat}
    Wait until page contains        KRUSTY KRAB
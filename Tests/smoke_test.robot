*** Settings ***
Library     SeleniumLibrary
Documentation    Suite desctiption #smoke tests for Streamlet website
Resource    ../variables/variables.robot

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


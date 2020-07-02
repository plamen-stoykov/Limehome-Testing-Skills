*** Settings ***
Documentation   Successful retrieve booking details
Resource        resource.robot

*** Variables ***
${USER_LASTNAME}  Test_User_001
${USER_REF_NUMBER}  123456
${USER_NATIONALITY}  Danish (DK)
${USER_DOB}  1/1/1990
${INPUT_REG_LASTNAME_LOCATOR}  xpath://*[@id="mat-input-3"]
${INPUT_REG_DOB_LOCATOR}  xpath://*[@id="mat-input-4"]

*** Test Cases ***
Successful retrieve booking details
    [Tags]    smoke
    Open Browser to Homepage
    Input Lastname    ${USER_LASTNAME}
    Input Booking reference number    ${USER_REF_NUMBER}
    Retrieve booking data
    Wait Until Element Is Visible  ${INPUT_REG_LASTNAME_LOCATOR}  3s
    ${text}  Get Element Attribute  ${INPUT_REG_LASTNAME_LOCATOR}  ng-reflect-model
    Should Be Equal	 ${text}  ${USER_LASTNAME}

    # Fill in the Date of Birth and Change the nationality to Danish (DK)
    # Note:
    #   as per the requirement - also change the nationality to Denmark(DK) -
    #   such option does not appear in the Nationality drop-down and
    #   that's why the script is targeting the Danish (DK) option.
    Input Text  ${INPUT_REG_DOB_LOCATOR}   ${USER_DOB}
    Select nationality  ${USER_NATIONALITY}

    # Wait before closing the browser
    Sleep  10s
    [Teardown]    Close Browser

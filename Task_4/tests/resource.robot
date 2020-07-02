*** Settings ***
Documentation  A resource file with reusable keywords and variables
Library     SeleniumLibrary

*** Variables ***
${PROTOCOL}         https
${SERVER}           limehome-qa-task.herokuapp.com
${BROWSER}          Chrome
${TIMEOUT}          60
${DELAY}            0
${HOMEPAGE}         ${PROTOCOL}://${SERVER}
${CHROMEDRIVER}     <FULL_PATH>/drivers/chromedriver.exe


# Element locators

## Retrieve booking form
${INPUT_RB_LASTNAME_LOCATOR}  xpath://*[@id="mat-input-0"]
${INPUT_RB_REF_NUMBER_LOCATOR}  xpath://*[@id="mat-input-1"]
${BUTTON_RB_SUBMIT}  xpath://mat-card[@class="booking-reference-form mat-card"]//button

## Registartion form
${SELECT_NATIONALITY_LOCATOR}  xpath://*[@id="mat-select-1"]
${SELECT_NATIONALITY_OPTION_LOCATOR}  xpath://mat-option


*** Keywords ***
Open Browser to Homepage
    Open Browser  None  ${BROWSER}  executable_path=${CHROMEDRIVER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Go to  ${HOMEPAGE}

Input Lastname
    [Arguments]    ${lastname}
    Wait Until Element Is Visible   ${INPUT_RB_LASTNAME_LOCATOR}  ${TIMEOUT}
    Input Text  ${INPUT_RB_LASTNAME_LOCATOR}   ${lastname}

Input Booking reference number
    [Arguments]    ${ref_number}
    Wait Until Element Is Visible   ${INPUT_RB_REF_NUMBER_LOCATOR}  ${TIMEOUT}
    Input Text  ${INPUT_RB_REF_NUMBER_LOCATOR}  ${ref_number}

Retrieve booking data
#   This is to prevent the error ElementNotInteractableException: Message: element not interactable: element has zero size
    Wait Until Keyword Succeeds  2  1  Click Element  ${BUTTON_RB_SUBMIT}

Select nationality
    [Arguments]  ${nationality}
    Wait Until Element Is Visible  ${SELECT_NATIONALITY_LOCATOR}
    Click Element  ${SELECT_NATIONALITY_LOCATOR}
    Click Element  ${SELECT_NATIONALITY_OPTION_LOCATOR}/*[contains(text(), '${nationality}')]

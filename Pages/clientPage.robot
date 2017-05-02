*** Settings ***
Library                         Selenium2Library
Library                         String
Resource                        ../suite.robot

*** Variables ***
${clientTitle}=                 List
${clientLabel}=                 List
${clientCreateButton}=          xpath=//*[@id="j_idt49"]/a[1]
${clientFormLabel}=             Create New Client
${clientSaveButton}=            xpath=//*[@id="j_idt51"]/a[1]
${clientCreatedMessage}=        Client was successfully created.
${clientShowAllUsersButton}=    xpath=//*[@id="j_idt50"]/a[4]
${clientNameTextArea}=          id=name
${clientEmailTextArea}=         id=email
${clientGenderMaleCheckbox}=    id=gender:0
${clientSSNTextArea}=           id=socialSecurityNumber

*** Keywords ***
Create Client
                                ${clientName}=                      Generate Random String         10                [LETTERS]
                                ${clientEmail}=                     Catenate                       SEPARATOR=        ${clientName}    @email.com
                                ${clientSSN}=                       Generate Random String         7                 [NUMBERS]
                                Click ELement                       ${clientCreateButton}
                                Wait Until Page Contains            ${clientFormLabel}
                                Input Text                          ${clientNameTextArea}                        ${clientName}
                                Input Text                          ${clientEmailTextArea}                       ${clientEmail}
                                Select Checkbox                     ${clientGenderMaleCheckbox}
                                Input Text                          ${clientSSNTextArea}        ${clientSSN}
                                Click Element                       ${clientSaveButton}
                                Wait Until Page Contains            ${clientCreatedMessage}
                                Click Element                       ${clientShowAllUsersButton}
                                Wait Until Page Contains            ${clientLabel}
                                Page Should Contain                 ${clientName}

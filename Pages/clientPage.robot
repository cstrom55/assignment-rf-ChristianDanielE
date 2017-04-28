*** Settings ***
Library                         Selenium2Library
Library                         String
Resource                        ../suite.robot
*** Variables ***
${clientLabel}=                 List
${clientCreateButton}=          xpath=//*[@id="j_idt49"]/a[1]
${clientFormLabel}=             Create New Client
${clientSaveButton}=            xpath=//*[@id="j_idt51"]/a[1]
${clientCreatedMessage}=        Client was successfully created.
${clientShowAllUsersButton}=    xpath=//*[@id="j_idt50"]/a[4]

*** Keywords ***
Create Client
                                ${clientName}=                      Generate Random String         10                [LETTERS]
                                ${clientEmail}=                     Catenate                       SEPARATOR=        ${clientName}    @email.com
                                ${clientSSN}=                       Generate Random String         7                 [NUMBERS]
                                Click ELement                       ${clientCreateButton}
                                Wait Until Page Contains            ${clientFormLabel}
                                Input Text                          id=name                        ${clientName}
                                Input Text                          id=email                       ${clientEmail}
                                Select Checkbox                     id=gender:0
                                Input Text                          id=socialSecurityNumber        ${clientSSN}
                                Click Element                       ${clientSaveButton}
                                Wait Until Page Contains            ${clientCreatedMessage}
                                Click Element                       ${clientShowAllUsersButton}
                                Wait Until Page Contains            ${clientLabel}
                                Page Should Contain                 ${clientName}

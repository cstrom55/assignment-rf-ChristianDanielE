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


${clientDeleteButtonXpath}=     //*[@id="j_idt49"]/table/tbody/tr
${clientEditButtonXpath}=       //*[@id="j_idt49"]/table/tbody/tr
${clientDeletePt2}=             ]/td[7]/a[3]
${clientNamePt2}=               ]/td[2]
${clientEditPt2}=               ]/td[7]/a[2]




*** Keywords ***
Create Client
                                ${clientName}=                       Generate Random String                10                                     [LETTERS]
                                ${clientEmail}=                      Catenate                              SEPARATOR=                             ${clientName}                 @email.com
                                ${clientSSN}=                        Generate Random String                7                                      [NUMBERS]
                                Click Element                        ${clientCreateButton}
                                Wait Until Page Contains             ${clientFormLabel}
                                Input Text                           id=name                               ${clientName}
                                Input Text                           id=email                              ${clientEmail}
                                Select Checkbox                      id=gender:0
                                Input Text                           id=socialSecurityNumber               ${clientSSN}
                                Click Element                        ${clientSaveButton}
                                Wait Until Page Contains             ${clientCreatedMessage}
                                Click Element                        ${clientShowAllUsersButton}
                                Wait Until Page Contains             ${clientLabel}
                                Page Should Contain                  ${clientName}


Cleanup Client

                                Navigate to Client
                                ${count}=                            Get Matching Xpath Count              ${clientDeleteButtonXpath}
                                ${clientDeleteButtonXpath}           Catenate                              SEPARATOR=                             ${clientDeleteButtonXpath}    [                           #adds a [ to the xpath we're building
                                ${clientDeleteButtonXpath}           Catenate                              SEPARATOR=                             ${clientDeleteButtonXpath}    ${count}                    #adds a number to the xpath (the last row on the table)
                                ${clientDeleteButtonXpath}           Catenate                              SEPARATOR=                             ${clientDeleteButtonXpath}    ${clientDeletePt2}          #adds the ned of the xpath we're building
                                Click Element                        xpath= ${clientDeleteButtonXpath}


Select Client Edit
                                [Arguments]                          ${clientName}



                                ${count}=                            Get Matching Xpath Count              ${clientDeleteButtonXpath}
                                ${clientDeleteButtonXpath}           Catenate                              SEPARATOR=                             ${clientDeleteButtonXpath}    [                           #adds a [ to the xpath we're building
                                ${clientDeleteButtonXpath}           Catenate                              SEPARATOR=                             ${clientDeleteButtonXpath}    ${count}                    #adds a number to the xpath (the last row on the table)
                                ${clientDeleteButtonXpath}           Catenate                              SEPARATOR=                             ${clientDeleteButtonXpath}    ${clientDeletePt2}          #adds the ned of the xpath we're building
                                #                                    Log to console                        ${clientDeleteButtonXpath}

                                : For                                ${index}                              in range                               1                             ${count}
                                \                                    # Log to console                      ${index}
                                \                                    ${forTempVar}                         Catenate                               SEPARATOR=                    ${clientEditButtonXpath}    [
                                \                                    ${forTempVar}                         Catenate                               SEPARATOR=                    ${forTempVar}               ${index}
                                \                                    ${forTempVar}                         Catenate                               SEPARATOR=                    ${forTempVar}               ${clientNamePt2}
                                \                                    ${forTempText}                        Get Text                               xpath=${forTempvar}
                                \                                    #                                     Log to console                         ${forTempVar}
                                \                                    #                                     Log to console                         ${forTempText}
                                \                                    Run Keyword If                        '${forTempText}' == '${clientName}'    Exit For Loop
                                Log to console                       For loop is over

                                Log to console                       ${forTempVar}


                                ${tempvar1}                          Catenate                              SEPARATOR=                             ${clientEditButtonXpath}      [
                                ${tempvar2}                          Catenate                              SEPARATOR=                             ${tempvar1}                   ${index}
                                ${xpathToSpecificEditButton}         Catenate                              SEPARATOR=                             ${tempvar2}                   ${clientEditPt2}

                                Log to console                       ${clientName}

                                Log to console                       ${xpathToSpecificEditButton}


                                Click element                        xpath=${xpathToSpecificEditButton}





*** Settings ***
Library                                   Selenium2Library
Library                                   String
Resource                                  ../suite.robot
*** Variables ***
######## DELETE THESE LATER #
${clientLabel}=                           List
${clientCreateButton}=                    xpath=//*[@id="j_idt49"]/a[1]
${clientFormLabel}=                       Create New Client
${clientSaveButton}=                      xpath=//*[@id="j_idt51"]/a[1]
${clientCreatedMessage}=                  Client was successfully created.
${clientShowAllUsersButton}=              xpath=//*[@id="j_idt50"]/a[4]

${clientTitle}=                           List
${clientLabel}=                           List
${clientCreateButton}=                    xpath=//*[@id="j_idt49"]/a[1]
${clientFormLabel}=                       Create New Client
${clientSaveButton}=                      xpath=//*[@id="j_idt51"]/a[1]
${clientCreatedMessage}=                  Client was successfully created.
${clientShowAllUsersButton}=              xpath=//*[@id="j_idt50"]/a[4]
${clientNameTextArea}=                    id=name
${clientEmailTextArea}=                   id=email
${clientGenderMaleCheckbox}=              id=gender:0
${clientSSNTextArea}=                     id=socialSecurityNumber
########DELETE THESE #########
${editClientXpath}=                       //*[@id="j_idt49"]/table/tbody/tr
${editClientNameXpath}=                   //*[@id="j_idt49"]/table/tbody/tr
${editClientXpathLeftBracket}=            [

${editClientBaseXpath}
${editClientXpathNameEnd}=                ]/td[2]
${editClientXpathEditButtonEnd}=          ]/td[7]/a[2]
${editClientForIndex}
${editClientCount}
${editClientNameText}
${editClientCorrectClientXpathNumber}
${editClientNameDropdownXpath}            //*[@id="name"]
${editClientEmailXpath}                   //*[@id="email"]
${editClientSSNXpath}                     //*[@id="socialSecurityNumber"]
${editClientNameDropdownResult}


${editClientXpathEditName}=               ]/td[2]
${editClientXpathEditEmail}=              ]/td[4]
${editClientXpathEditGender}=             ]/td[5]
${editClientXpathEditSSN}=                ]/td[7]

${editClientNameStartValueXpath}
${editClientEmailStartValueXpath}
${editClientGenderStartValueXpath}
${editClientSSNStartValueXpath}

${editClientNameStartValue}
${editClientEmailStartValue}
${editClientGenderStartValue}
${editClientSSNStartValue}

${editClientNameChangedValue}=            name
${editClientEmailChangedValue}=           email
${editClientGenderEndValue}
${editClientSSNChangedValue}=             66666666

${editClientMaleRadioButtonXpath}         //*[@id="gender:0"]
${editClientFemaleRadioButtonXpath}       //*[@id="gender:1"]
${editClientSaveButton}                   //*[@id="j_idt51"]/a[1]

${editClientUpdateSuccessfulText}         Client was successfully updated.
${editClientNameTextChangedXpath}         //*[@id="j_idt50"]/table/tbody/tr[2]/td[2]/span
${editClientEmailTextChangedXpath}        //*[@id="j_idt50"]/table/tbody/tr[4]/td[2]/span
${editClientSSNTextChangedXpath}          //*[@id="j_idt50"]/table/tbody/tr[6]/td[2]/span
${editClientGenderTextChangedXpath}       //*[@id="j_idt50"]/table/tbody/tr[5]/td[2]/span


${editClientShowAllClientsButtonXpath}    //*[@id="j_idt50"]/a[4]

${editClientDeleteButton}                 //*[@id="j_idt50"]/a[1]

${editClientName}
${clientName}


${deleteClientCount}
${deleteClientXpath}                      //*[@id="j_idt49"]/table/tbody/tr
${deleteClientXpathLeftBracket}=          [
${deleteClientXpathEnd}                   ]/td[7]/a[3]
${deleteClientMessage}                    Client was successfully deleted.



*** Keywords ***

Create Client
                                          ${clientName}=                                     Generate Random String                          10                                                  [LETTERS]
                                          ${clientEmail}=                                    Catenate                                        SEPARATOR=                                          ${clientName}                          @email.com
                                          ${clientSSN}=                                      Generate Random String                          7                                                   [NUMBERS]
                                          Click ELement                                      ${clientCreateButton}
                                          Wait Until Page Contains                           ${clientFormLabel}
                                          Input Text                                         ${clientNameTextArea}                           ${clientName}
                                          Input Text                                         ${clientEmailTextArea}                          ${clientEmail}
                                          Select Checkbox                                    ${clientGenderMaleCheckbox}
                                          Input Text                                         ${clientSSNTextArea}                            ${clientSSN}
                                          Click Element                                      ${clientSaveButton}
                                          Wait Until Page Contains                           ${clientCreatedMessage}
                                          Click Element                                      ${clientShowAllUsersButton}
                                          Wait Until Page Contains                           ${clientLabel}
                                          Page Should Contain                                ${clientName}

Delete Client

                                          ${deleteClientCount}                               Get Matching Xpath Count                        ${deleteClientXpath}


                                          ${deleteClientXpath}=                                Catenate                                        SEPARATOR=                                          ${deleteClientXpath}                     ${deleteClientXpathLeftBracket}   ${deleteClientCount}  ${deleteClientXpathEnd}


                                          Click Element                                      xpath=${deleteClientXpath}
                                          Page Should Contain                                ${deleteClientMessage}







Select Client Edit
                                          [Arguments]                                        ${editClientName}


                                          ${editClientName}                                  Convert To Lowercase                            ${editClientName}

                                          ${editClientCount}                                 Get Matching Xpath Count                        ${editClientXpath}
                                          ${editClientCount}                                 Evaluate                                        ${editClientCount} +2
                                          ${editClientCount2}                                Evaluate                                        ${editClientCount} -1

                                          ${editClientXpath}=                                Catenate                                        SEPARATOR=                                          ${editClientXpath}                     ${editClientXpathLeftBracket}
                                          ${editClientXpath}=                                Catenate                                        SEPARATOR=                                          ${editClientXpath}                     ${editClientCount}
                                          ${editClientXpath}=                                Catenate                                        SEPARATOR=                                          ${editClientXpath}                     ${editClientXpathEditButtonEnd}
                                          #loop trough the table for the name
                                          :FOR                                               ${editClientForIndex}                           IN RANGE                                            1                                      ${editClientCount}
                                          \                                                  Run Keyword If                                  '${editClientForIndex}' == '${editClientCount2}'    Fail                                   client not in list
                                          \                                                  ${editClientNameXpathForLoop}                   Catenate                                            SEPARATOR=                             ${editClientNameXpath}             ${editClientXpathLeftBracket}    ${editClientForIndex}    ${editClientXpathNameEnd}
                                          \                                                  ${editClientNameText}                           Get Text                                            xpath=${editClientNameXpathForLoop}
                                          \                                                  ${editClientNameText}                           Convert To Lowercase                                ${editClientNameText}
                                          \                                                  Run Keyword If                                  '${editClientNameText}' == '${editClientName}'      Exit For Loop
                                          #making 2 xpaths
                                          ${editClientBaseXpath}                             catenate                                        SEPARATOR=                                          ${editClientNameXpath}                 ${editClientXpathLeftBracket}      ${editClientForIndex}
                                          ${editClientNameXpath}                             catenate                                        SEPARATOR=                                          ${editClientBaseXpath}                 ${editClientXpathEditButtonEnd}
                                          #making xpaths to save values
                                          ${editClientNameStartValueXpath}                   catenate                                        ${editClientBaseXpath}                              ${editClientXpathEditName}
                                          ${editClientEmailStartValueXpath}                  catenate                                        ${editClientBaseXpath}                              ${editClientXpathEditEmail}
                                          ${editClientGenderStartValueXpath}                 catenate                                        ${editClientBaseXpath}                              ${editClientXpathEditGender}
                                          ${editClientSSNStartValueXpath}                    catenate                                        ${editClientBaseXpath}                              ${editClientXpathEditSSN}
                                          #getting values from those xpaths
                                          ${editClientNameStartValue}                        Get Text                                        xpath=${editClientNameStartValueXpath}
                                          ${editClientEmailStartValue}                       Get Text                                        xpath=${editClientEmailStartValueXpath}
                                          ${editClientGenderStartValue}                      Get Text                                        xpath=${editClientGenderStartValueXpath}
                                          ${editClientSSNStartValue}                         Get Text                                        xpath=${editClientSSNStartValueXpath}
                                          #press edit
                                          Click Element                                      xpath=${editClientNameXpath}
                                          #assert you're on the page
                                          ${editClientNameDropdownResult}                    Get Value                                       xpath=${editClientNameDropdownXpath}
                                          ${editClientNameDropdownResult}                    Convert to Lowercase                            ${editClientNameDropdownResult}
                                          Should Contain                                     ${editClientNameDropdownResult}                 ${editClientName}
                                          #change values
                                          Input Text                                         ${editClientNameDropdownXpath}                  ${editClientNameChangedValue}
                                          Input Text                                         ${editClientEmailXpath}                         ${editClientEmailChangedValue}
                                          Input Text                                         ${editClientSSNXpath}                           ${editClientSSNChangedValue}

                                          Run Keyword If                                     '${editClientGenderStartValue}' == 'M'          SetFemale
                                          Run Keyword If                                     '${editClientGenderStartValue}' == 'F'          SetMale

                                          Click Element                                      ${editClientSaveButton}
                                          Wait Until Page Contains                           ${editClientUpdateSuccessfulText}

                                          ${editClientNameTextChangedXpath}                  Get Text                                        ${editClientNameTextChangedXpath}
                                          ${editClientEmailTextChangedXpath}                 Get Text                                        ${editClientEmailTextChangedXpath}
                                          ${editClientSSNTextChangedXpath}                   Get Text                                        ${editClientSSNTextChangedXpath}
                                          ${editClientGenderTextChangedXpath}                Get Text                                        ${editClientGenderTextChangedXpath}

                                          Should Contain                                     ${editClientNameTextChangedXpath}               ${editClientNameChangedValue}
                                          Should Contain                                     ${editClientEmailTextChangedXpath}              ${editClientEmailChangedValue}
                                          Should Contain                                     ${editClientSSNTextChangedXpath}                ${editClientSSNChangedValue}
                                          Should Contain                                     ${editClientGenderTextChangedXpath}             ${editClientGenderEndValue}




SetMale
                                          Click Element                                      xpath=${editClientMaleRadioButtonXpath}
                                          Log to console                                     set male
                                          Set Variable                                       ${editClientGenderEndValue}                     M

SetFemale
                                          Click Element                                      xpath=${editClientFemaleRadioButtonXpath}
                                          log to console                                     set female
                                          Set Variable                                       ${editClientGenderEndValue}                     F


Reset Client Edit
                                          Click element                                      xpath=${editClientDeleteButton}
                                          Click element                                      xpath=${editClientShowAllClientsButtonXpath}
                                          Run Keyword                                        Edit Client Recreate

Edit Client Recreate



                                          ${clientEmail}=                                    Catenate                                        SEPARATOR=                                          ${TestClientName}                      @email.com
                                          ${clientSSN}=                                      Generate Random String                          7                                                   [NUMBERS]
                                          Click ELement                                      ${clientCreateButton}
                                          Wait Until Page Contains                           ${clientFormLabel}
                                          Input Text                                         ${clientNameTextArea}                           ${TestClientName}
                                          Input Text                                         ${clientEmailTextArea}                          ${clientEmail}
                                          Select Checkbox                                    ${clientGenderMaleCheckbox}
                                          Input Text                                         ${clientSSNTextArea}                            ${clientSSN}
                                          Click Element                                      ${clientSaveButton}
                                          Wait Until Page Contains                           ${clientCreatedMessage}
                                          Click Element                                      ${clientShowAllUsersButton}
                                          Wait Until Page Contains                           ${clientLabel}
                                          Page Should Contain                                ${TestClientName}


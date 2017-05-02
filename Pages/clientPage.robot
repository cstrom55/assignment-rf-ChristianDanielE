*** Settings ***
Library                                  Selenium2Library
Library                                  String
Resource                                 ../suite.robot
*** Variables ***
######## DELETE THESE LATER #
${clientLabel}=                          List
${clientCreateButton}=                   xpath=//*[@id="j_idt49"]/a[1]
${clientFormLabel}=                      Create New Client
${clientSaveButton}=                     xpath=//*[@id="j_idt51"]/a[1]
${clientCreatedMessage}=                 Client was successfully created.
${clientShowAllUsersButton}=             xpath=//*[@id="j_idt50"]/a[4]
########DELETE THESE #########
${editClientXpath}=                      //*[@id="j_idt49"]/table/tbody/tr
${editClientNameXpath}=                  //*[@id="j_idt49"]/table/tbody/tr
${editClientXpathLeftBracket}=           [

${editClientXpathNameEnd}=               ]/td[2]
${editClientXpathEditButtonEnd}=         ]/td[7]/a[2]
${editClientForIndex}
${editClientCount}
${editClientNameText}
${editClientCorrectClientXpathNumber}


*** Keywords ***
Select Client Edit
                                         [Arguments]                          ${editClientName}

                                         ${editClientName}                    Convert To Lowercase             ${editClientName}

                                         ${editClientCount}                   Get Matching Xpath Count         ${editClientXpath}
                                         ${editClientCount}                   Evaluate                         ${editClientCount} +2
                                         ${editClientCount2}                  Evaluate                         ${editClientCount} -1

                                         ${editClientXpath}=                  Catenate                         SEPARATOR=                                          ${editClientXpath}                     ${editClientXpathLeftBracket}
                                         ${editClientXpath}=                  Catenate                         SEPARATOR=                                          ${editClientXpath}                     ${editClientCount}
                                         ${editClientXpath}=                  Catenate                         SEPARATOR=                                          ${editClientXpath}                     ${editClientXpathEditButtonEnd}

                                         :FOR                                 ${editClientForIndex}            IN RANGE                                            1                                      ${editClientCount}
                                         \                                    Run Keyword If                   '${editClientForIndex}' == '${editClientCount2}'    Fail                                   client not in list
                                         \                                    ${editClientNameXpathForLoop}    Catenate                                            SEPARATOR=                             ${editClientNameXpath}             ${editClientXpathLeftBracket}    ${editClientForIndex}    ${editClientXpathNameEnd}
                                         \                                    ${editClientNameText}            Get Text                                            xpath=${editClientNameXpathForLoop}
                                         \                                    ${editClientNameText}            Convert To Lowercase                                ${editClientNameText}
                                         \                                    Run Keyword If                   '${editClientNameText}' == '${editClientName}'      Exit For Loop
                                         log to console                       exited for loop
                                         log to console                       ${editClientForIndex}
                                         #todo click make xpath to edit button and click it, then change some shit save it and assert the changes went trough

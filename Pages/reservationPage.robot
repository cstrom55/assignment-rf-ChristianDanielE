*** Settings ***
Resource                            loginPage.robot
Resource                            clientPage.robot
Resource                            dashboardPage.robot

*** Variables ***
${reservationTitle}=                List
${reservationLabel}=                Create New Hotel Reservation
${reservationEntryDateLabel}=       entryDate
${reservationHeader}=               xpath=//*[@id="page-wrapper"]/div/div/div/h1
${reservationCreateButton}=         xpath=//*[@id="j_idt49"]/a[1]
${reservationEntryDateTextArea}=    id=entryDate
${reservationExitDateTextArea}=     id=exitDate
${reservationBedroomDropdown}=      id=bedroomId
${reservationClientDropdown}=       id=clientId
${reservationStatusDropdown}=       id=reservationStatusId
${reservationSaveButton}=           xpath=//*[@id="j_idt50"]/a[1]
${reservationCreateSuccess}=        HotelReservation was successfully created
${reservationDeleteNr5Button}=      xpath=//*[@id="j_idt49"]/table/tbody/tr[5]/td[8]/a[3]
${reservationDeleteSuccess}=        HotelReservation was successfully deleted

${reservationHomeButtonXpath}       //*[@id="wrapper"]/nav/div[1]/a

*** Keywords ***
Create Reservation
                                    Click element                                            ${reservationCreateButton}
                                    Wait until page contains                                 ${reservationEntryDateLabel}
                                    Enter text                                               ${reservationEntryDateTextArea}    2017-08-02
                                    Enter text                                               ${reservationExitDateTextArea}     2017-08-09
                                    Click element                                            ${reservationHeader}
                                    Select element                                           ${reservationBedroomDropdown}
                                    Select element                                           ${reservationClientDropdown}
                                    Select element                                           ${reservationStatusDropdown}
                                    Click element                                            ${reservationSaveButton}
                                    Wait until page contains                                 ${reservationCreateSuccess}
Delete Reservation
                                    Click element                                            ${reservationDeleteNr5Button}
                                    Wait until page contains                                 ${reservationDeleteSuccess}


Test Homebutton
                                    Click Element                                            ${reservationHomeButtonXpath}
                                    Page should Contain                                      ${dashboardTitle}



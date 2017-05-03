*** Settings ***
Resource                         dashboardPage.robot

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

${reservationHomeButtonXpath}    //*[@id="wrapper"]/nav/div[1]/a
*** Keywords ***
Test Homebutton
                                 Click Element                      ${reservationHomeButtonXpath}
                                 Page should Contain                ${dashboardTitle}

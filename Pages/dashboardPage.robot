*** Settings ***
Resource                             loginPage.robot
Resource                             clientPage.robot
Resource                             reservationPage.robot
*** Variables ***
${dashboardTitle}=                       Dashboard
${dashboardLabel}=                       Dashboard
${dashboardDropdownMenu}=                xpath=//*[@id="wrapper"]/nav/ul/li[2]/a/i[1]
${dashboardDropdownLogoutButton}=        xpath=//*[@id="wrapper"]/nav/ul/li[2]/ul/li/a
${dashboardSidebarBedroomButton}=        xpath=//*[@id="side-menu"]/li[3]/a
${dashboardSidebarBillButton}=           xpath=//*[@id="side-menu"]/li[4]/a
${dashboardSidebarClientButton}=         xpath=//*[@id="side-menu"]/li[5]/a
${dashboardSidebarReservationButton}=    xpath=//*[@id="side-menu"]/li[6]/a
${dashboardSidebarUserButton}=           xpath=//*[@id="side-menu"]/li[7]/a
${dashboardSidebarDashboardButton}=      xpath=//*[@id="side-menu"]/li[2]/a
${dashboardSearchTextArea}=              xpath=//*[@id="side-menu"]/li[1]/div/input
${dashboardSearchButton}=                xpath=//*[@id="side-menu"]/li[1]/div/span
${dashboardSearchResultTitle}=           Search results:





*** Keywords ***
Perform Logout
                                     Click element                                    ${dashboardDropdownMenu}
                                     Wait until page contains element                 ${dashboardDropdownLogoutButton}
                                     Click element                                    ${dashboardDropdownLogoutButton}
                                     Wait until page contains                         ${loginLabel}
                                     Title should be                                  ${loginTitle}
Navigate To Client
                                     Click Element                                    ${dashboardSidebarClientButton}
                                     Wait Until Page Contains                         ${clientLabel}

Navigate To Reservation
                                         Click Element                                    ${dashboardSidebarReservationButton}
                                         Wait until page contains                         ${reservationLabel}


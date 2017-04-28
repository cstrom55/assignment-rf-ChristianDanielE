*** Settings ***
Resource                             loginPage.robot
Resource                             clientPage.robot
*** Variables ***
${dashboardTitle}=                   Dashboard
${dashboardLabel}=                   Dashboard
${dashboardDropdownMenu}=            xpath=//*[@id="wrapper"]/nav/ul/li[2]/a/i[1]
${dashboardDropdownLogoutButton}=    xpath=//*[@id="wrapper"]/nav/ul/li[2]/ul/li/a

${dashboardSidebarClientButton}=     xpath=//*[@id="side-menu"]/li[5]/a



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

*** Settings ***
Resource                      ../Cred/loginCred.robot
Resource                      dashboardPage.robot

*** Variables ***
${loginTitle}=                Hotel Accomodation - login page
${loginLabel}=                Please, login!
${loginUserTextField}=        id=formLogin:login
${loginPasswordTextField}=    id=formLogin:senha
${loginBtnLogin}=             name=formLogin:j_idt27

*** Keywords ***
Perform Login
                              Input text                             ${loginUserTextField}        ${username}
                              Input text                             ${loginPasswordTextField}    ${password}
                              Click element                          ${loginBtnLogin}
                              Wait until page contains               ${dashboardLabel}




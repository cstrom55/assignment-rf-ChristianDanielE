*** Settings ***
Library                   Selenium2Library
Library                   OperatingSystem
Resource                  setupTeardown.robot
Resource                  ./Pages/clientPage.robot
Resource                  ./Pages/dashboardPage.robot
Resource                  ./Pages/loginPage.robot
Resource                  ./Cred/loginCred.robot

Test setup                Setup
Test teardown             Teardown

*** Variables ***
# JOÃO PAULO              THALLYS                        Yuri                 MARCOS OLIVEIVA    YANNE
${TestClientName}         THALLYS

*** Test Cases ***
Testcase1_LoginLogout
                          Perform Login
                          Perform Logout
Testcase2_CreateClient
                          Perform Login
                          Navigate To Client
                          Create Client
                          Delete Client
                          Perform Logout

Testcase3_EditClient
                          Perform Login
                          Navigate To Client
                          Select Client Edit             ${TestClientName}
                          Reset Client Edit
                          Perform Logout

Testcase4_DeleteClient
                          Perform Login
                          Navigate To Client
                          Delete Client
                          Perform Logout

Testcase5_HomeButton
                          Perform Login
                          Navigate to Reservation
                          Test HomeButton
                          Perform Logout




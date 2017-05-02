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

*** Test Cases ***
Testcase1_LoginLogout
                          Perform Login
                          Perform Logout
Testcase2_CreateClient
                          Perform Login
                          Navigate To Client
                          Create Client
                          Cleanup Client
                          Perform Logout

Testcase3_EditClient
                          Perform Login
                          Navigate To Client
                          Select Client Edit                   THALLYS
                          Sleep           5s


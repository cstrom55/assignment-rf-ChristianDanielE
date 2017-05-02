*** Settings ***
Library                     Selenium2Library
Library                     OperatingSystem
Resource                    setupTeardown.robot
Resource                    ./Pages/bedroomPage.robot
Resource                    ./Pages/billPage.robot
Resource                    ./Pages/clientPage.robot
Resource                    ./Pages/reservationPage.robot
Resource                    ./Pages/clientPage.robot
Resource                    ./Pages/userPage.robot
Resource                    ./Pages/loginPage.robot
Resource                    ./Cred/loginCred.robot

Test setup                  Setup
Test teardown               Teardown

*** Variables ***
${searchInput}=             Bedroom

*** Test Cases ***
Testcase1_LoginLogout
                            Perform Login
                            Perform Logout
Testcase2_CreateClient
                            Perform Login
                            Navigate To Client
                            Create Client
                            Perform Logout
Testcase6_SearchFunction
                            Perform Login
                            Perform Search                 ${searchInput}
                            Perform Logout
Testcase7_Navigation
                            Perform Login
                            Navigate To Bedroom
                            Navigate To Bill
                            Navigate To Client
                            Navigate To Reservation
                            Navigate To User
                            Navigate To Dashboard
                            Perform Logout








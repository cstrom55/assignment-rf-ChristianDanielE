*** Settings ***
Library                        Selenium2Library
Library                        OperatingSystem
Resource                       setupTeardown.robot
Resource                       ./Pages/bedroomPage.robot
Resource                       ./Pages/billPage.robot
Resource                       ./Pages/clientPage.robot
Resource                       ./Pages/reservationPage.robot
Resource                       ./Pages/clientPage.robot
Resource                       ./Pages/userPage.robot
Resource                       ./Pages/loginPage.robot
Resource                       ./Cred/loginCred.robot

Test setup                     Setup
Test teardown                  Teardown

*** Variables ***
# JOÃO PAULO                   THALLYS                                                                        Yuri                 MARCOS OLIVEIVA    YANNE
${TestClientName}              THALLYS

${searchInput}=                Bedroom

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
                               Select Client Edit                                                             ${TestClientName}
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
Testcase6_SearchFunction
                               Perform Login
                               Perform Search                                                                 ${searchInput}
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

                               ##CreateReservation gives persistence error, can't create new reservations.
Testcase8_CreateReservation
                               Perform Login
                               Navigate To Reservation
                               Create Reservation
                               #Navigate To Reservation
                               #Delete Reservation
                               Perform Logout



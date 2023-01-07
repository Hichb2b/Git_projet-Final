*** Settings ***
Library    SeleniumLibrary
Library    GetMail.py
Test Setup    connecter au site    ${Url}    ${Browser}
#Test Teardown    se deconnecter du compte  
Test Teardown    se deconnecter
Resource    ../Ressources/Keywords/Keywords.robot
*** Variables ***
${firstN}    1stname9
${lastN}    lastname
${vtelephone}    999-999-9999
${vpassword}    password
${vconfirm}    password 

*** Test Cases ***
creation d un nouveau compte sans newletters     
    clik My Account
    click Registre
    Sleep    2
    remplir Formulaire    ${firstN}    ${lastN}    ${vtelephone}    ${vpassword}    ${vconfirm}
    #test de verification 
    verifier creation
    ouvrir page main
    fermer page main

       

*** Settings ***
Library    SeleniumLibrary
Test Setup    connecter au site    ${Url}    ${Browser}  
#Test Teardown    se deconnecter du compte    log    message 
Resource    ../Ressources/Keywords/Keywords.robot
*** Variables ***
${firstN}    1stname
${lastN}    LstName
${vtelephone}    999-999-9999
${vemail}    nom_prenom@gmail.com
${vpassword}    password
${vconfirm}    password 

*** Test Cases ***
creation d un nouveau compte sans newletters     
    clikMyAccount
    clickRegistre
    remplirFormulaire    ${firstN}    ${lastN}    ${vemail}     ${vtelephone}    ${vpassword}    ${vconfirm}

validation de creation        

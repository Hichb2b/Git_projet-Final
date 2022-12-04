*** Settings ***
Library    SeleniumLibrary
Test Setup    connecter au site    ${Url}    ${Browser}
#Test Teardown    se deconnecter du compte  
Test Teardown    se deconnecter
Resource    ../Ressources/Keywords/Keywords.robot
*** Variables ***
${firstN}    1stname6
${lastN}    lastname
${vtelephone}    999-999-9999
${vemail}    ${firstN}@gmail.com
${vpassword}    password
${vconfirm}    password 

*** Test Cases ***
creation d un nouveau compte sans newletters     
    clik My Account
    click Registre
    Sleep    2
    remplir Formulaire    ${firstN}    ${lastN}    ${vemail}     ${vtelephone}    ${vpassword}    ${vconfirm}
 
validation de creation        

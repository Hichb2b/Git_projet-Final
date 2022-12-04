*** Settings ***
Library    SeleniumLibrary
Resource    ../Ressources/Keywords/Keywords.robot
Test Setup    connecter au site    ${Url}    ${Browser}
Test Teardown    se deconnecter 
*** Variables ***
${pdtInv}    xxphone
*** Test Cases ***
test produit non disponible
    click link chekout
    rechercher produit non disponible    ${pdtInv}
    verification disponibilite

    

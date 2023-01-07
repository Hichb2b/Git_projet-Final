*** Settings ***
Library    SeleniumLibrary
Variables    ../Ressources/Locators/locators.py
Resource    ../Ressources/Keywords/Keywords.robot
Library    GetMail.py

*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home    
${Browser}    gc  
${firstN}    Inna
${lastN}    Diachenko
${vtelephone}    999-999-9999
${vpassword}    1234
${vconfirm}    1234   


*** Test Cases ***
Test s'inscrire a l'applic avec Newsletter
    [Documentation]    L'utilisateur peut s'inscrire à l'application en optant pour l'abonnement à la Newsletter    
    ...    Se connecter avec le compte d'utilisateur
    connecter au site    ${Url}    ${Browser}
    clikMyAccount
    clickRegistre
    remplirFormulaire1    ${firstN}    ${lastN}    ${vtelephone}    ${vpassword}    ${vconfirm}
    choisir Newsletter
    choisir Privacy Policy
    continuer l'inscription
    verifier creation
    logout
    se deconnecter


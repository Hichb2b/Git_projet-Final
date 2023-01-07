*** Settings ***
Library    SeleniumLibrary
Variables    ../Ressources/Locators/locators.py
Resource    ../Ressources/Keywords/Keywords.robot


*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home    
${Browser}    gc  
${firstN}    Inna
${lastN}    Diachenko
${vtelephone}    999-999-9999
${vemail}    longine777@gmail.com    
${vpassword}    1234
${vconfirm}    1234   


*** Test Cases ***
Test enregistrer un compt en double
    [Documentation]    L'utilisateur ne peut pas enregistrer un compte en double    
    ...    Avoir un compte doit créé
    connecter au site    ${Url}    ${Browser}
    clikMyAccount
    clickRegistre
    remplirFormulaire2    ${firstN}    ${lastN}    ${vemail}    ${vtelephone}    ${vpassword}    ${vconfirm} 
    choisir Privacy Policy 
    continuer l'inscription
    verification d'enregistrer un compte double
    se deconnecter 


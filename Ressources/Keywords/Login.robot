*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locators.py
*** Variables ***
${TIMEOUT}

*** Keywords ***
Login
    [Documentation]    Ce keyword permet de se connecter au site
    [Arguments]    ${vUrl}    ${vBrowser}    ${vUsername}    ${vPassword}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}    options=add_argument('--lang=fr')
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Cliquer sur l'onglet My account
    Click Element    ${link_myAccount}
    #Selectionner Login
    Wait Until Element Is Visible    ${link_Login}
    Click Element    ${link_Login}
    # Saisie du login
    Input text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe    
    Input text    ${txt_Password}    ${vPassword}
     # Click sur le bouton Login
    Click Button   ${btn_Login}
     # S'assurer que la page est chargee
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain     ${lblTitle}    My Account    

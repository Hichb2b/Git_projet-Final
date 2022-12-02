Library    SeleniumLibrary
Library    SeleniumLibrary
*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locateursite.py
*** Variables ***
${Url}    http://tutorialsninja.com/demo/index.php?route=common/home
${Browser}    gc

*** Keywords ***
#connexion déconnection
connecter au site
    [Arguments]    ${Url}    ${Browser} 
    Open Browser    ${Url}    ${Browser}  
    Maximize Browser Window
    Sleep    2

clikMyAccount
    Click Element    ${link_MyAccount}
clickRegistre
    Click Element    ${link_Register}
remplirFormulaire
    [Arguments]    ${firstN}    ${lastN}    ${vemail}     ${vtelephone}    ${vpassword}    ${vconfirm}
    Wait Until Element Is Visible    ${firstName}
    Input Text    ${firstName}    ${firstN}
    Input Text    ${lastName}    ${lastN}
    Input Text    ${email}    ${vemail}
    Input Text    ${telephone}    ${vtelephone}
    Input Password    ${password}    ${vpassword}    
    #Input Password    ${confirm}    ${vconfirm}  
    Click Element    ${btn_continue} 


se deconnecter du compte

#exercice 1

Library    SeleniumLibrary
Library    SeleniumLibrary
*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locateursite.py
*** Variables ***
${Url}    http://tutorialsninja.com/demo/index.php?route=common/home
${Browser}    gc

*** Keywords ***
#exercice1
#connexion déconnection
connecter au site
    [Documentation]    se connecter au site Your Store
    [Arguments]    ${Url}    ${Browser} 
    Open Browser    ${Url}    ${Browser}  
    Maximize Browser Window
    Sleep    2

clik My Account
    Click Element    ${link_MyAccount}
click Registre
    Click Element    ${link_Register}
remplir Formulaire
    [Documentation]    remplir le formulaire pour creer un nouveau compte
    [Arguments]    ${firstN}    ${lastN}    ${vemail}     ${vtelephone}    ${vpassword}    ${vconfirm}
    Wait Until Element Is Visible    ${firstName}
    Input Text    ${firstName}    ${firstN}
    Input Text    ${lastName}    ${lastN}
    Input Text    ${email}    ${vemail}
    Input Text    ${telephone}    ${vtelephone}
    Input Password    ${password}    ${vpassword}    
    Input Password    ${confirm}    ${vconfirm}
    Click Element    ${checkbox}  
    Click Element    ${btn_continue} 
verifier creation
    [Documentation]    verification du test
    Page Should Contain    Your Account Has Been Created!


se deconnecter 
    Close Browser

#exercice 7
click link chekout
    Click Element    ${link_ckchekout}
rechercher produit non disponible
    [Documentation]    introduire un produit qui ne se trouve pas dans le stock
    [Arguments]    ${pdtInv}
    Input Text    ${search}    ${pdtInv}
    Click Button    ${btn_search}
verification test
    [Documentation]    verification du test
    Page Should Contain    There is no product that matches the search criteria.

    

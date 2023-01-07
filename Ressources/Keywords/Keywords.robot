*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locators.py
Library    GetMail.py
*** Variables ***
${Url}    http://tutorialsninja.com/demo/index.php?route=common/home
${Browser}    gc

*** Keywords ***
connecter au site
    [Arguments]    ${Url}    ${Browser} 
    Open Browser    ${Url}    ${Browser}  
    Maximize Browser Window
    Sleep    2

clikMyAccount
    Click Element    ${link_MyAccount}

clickRegistre
    Click Element    ${link_Register}

remplirFormulaire1
    [Documentation]    remplir le formulaire pour creer un compte à la Newsletter
    [Arguments]    ${firstN}    ${lastN}    ${vtelephone}    ${vpassword}    ${vconfirm}
    Wait Until Element Is Visible    ${firstName}
    Input Text    ${firstName}    ${firstN}
    Input Text    ${lastName}    ${lastN}
    ${vemail}    Get Rand
    Input Text    ${email}    ${vemail}
    Input Text    ${telephone}    ${vtelephone}
    Input Password    ${password}    ${vpassword}    
    Input Password    ${confirm}    ${vconfirm} 

remplirFormulaire2    
    [Documentation]    remplir le formulaire pour creer un compte double
    [Arguments]    ${firstN}    ${lastN}    ${vemail}    ${vtelephone}    ${vpassword}    ${vconfirm}
    Wait Until Element Is Visible    ${firstName}
    Input Text    ${firstName}    ${firstN}
    Input Text    ${lastName}    ${lastN}
    Input Text    ${email}    ${vemail}
    Input Text    ${telephone}    ${vtelephone}
    Input Password    ${password}    ${vpassword}    
    Input Password    ${confirm}    ${vconfirm} 


remplir Formulaire
    [Documentation]    remplir le formulaire pour creer un nouveau compte sans newletters
    [Arguments]    ${firstN}    ${lastN}    ${vtelephone}    ${vpassword}    ${vconfirm}
    Wait Until Element Is Visible    ${firstName}
    Input Text    ${firstName}    ${firstN}
    Input Text    ${lastName}    ${lastN}
    ${vemail}    Get Rand
    Input Text    ${email}    ${vemail}
    Input Text    ${telephone}    ${vtelephone}
    Input Password    ${password}    ${vpassword}    
    Input Password    ${confirm}    ${vconfirm}
    Click Element    ${checkbox}  
    Click Element    ${btn_continue} 
    Sleep    2 

choisir Newsletter
    Click Element    ${btn_radio_Newsletter}
    #Checkbox Should Be Selected    //label[normalize-space()='Yes']//input[@type="radio"]

choisir Privacy Policy
    Click Element    ${btn_radio_PrivacyPolicy}

continuer l'inscription    
    Click Button    ${btn_continue1}
    Sleep    2

validation de creation
    Capture Page Screenshot    ./ScreenShot/pic.png    
    Page Should Contain    ${message_reussi}    
    Element Should Be Visible    ${btn_continue2}

verifier creation
    [Documentation]    verification du test
    Page Should Contain    Your Account Has Been Created!

verification d'enregistrer un compte double
    Capture Page Screenshot    ./ScreenShot/warning.png
    Page Should Contain Element    ${message_erreur}

ouvrir page main
    Click Link    ${btn2_continue}
fermer page main    
    clik My Account
    Click Link    ${logout}

logout
    Click Element    ${link_MyAccount}
    Click Element    ${link_Logout} 
    Click Element    ${btn_continue3}

se deconnecter
    Close Browser

click link chekout
    Click Element    ${link_ckchekout}
rechercher produit non disponible
    [Documentation]    introduire un produit qui ne se trouve pas dans le stock
    [Arguments]    ${pdtInv}
    Input Text    ${search}    ${pdtInv}
    Click Button    ${btn_search}
verification disponibilite
    [Documentation]    verification du test
    Page Should Contain    There is no product that matches the search criteria.
    

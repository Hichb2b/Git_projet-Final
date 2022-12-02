*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locators.py
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

remplirFormulaire
    [Arguments]    ${firstN}    ${lastN}    ${vemail}     ${vtelephone}    ${vpassword}    ${vconfirm}
    Wait Until Element Is Visible    ${firstName}
    Input Text    ${firstName}    ${firstN}
    Input Text    ${lastName}    ${lastN}
    Input Text    ${email}    ${vemail}
    Input Text    ${telephone}    ${vtelephone}
    Input Password    ${password}    ${vpassword}    
    Input Password    ${confirm}    ${vconfirm}  

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
    Element Should Contain    ${message_reussi}    Your Account Has Been Created!
    Element Should Be Visible    ${btn_continue2}

se deconnecter du compte
    Click Element    ${link_MyAccount}
    Click Element    ${link_Logout} 
    Click Element    ${btn_continue3}
    [Teardown]    Close Browser
    

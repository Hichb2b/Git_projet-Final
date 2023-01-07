*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locators.py

*** Keywords ***
Recherche Produit    
    [Documentation]    Ce keyword permet de rechercher des produits
    [Arguments]    ${vProduit}
    # Saisir le lom du produit dans la barre de recherche
    Wait Until Element Is Visible    ${txt_Recherche_name}
    Input Text    ${txt_Recherche_name}    ${vProduit}
    # Cliquer sur le buoton Search
    Click Element    ${search_xpath}
    # Verifier que la page affiche des resultats
    Page Should Contain Element    ${link_produit1}${vProduit}${link_produit2}
    


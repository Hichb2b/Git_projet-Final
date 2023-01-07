*** Settings ***
Library    SeleniumLibrary
Resource    ../Ressources/Keywords/Login.robot
Resource    ../Ressources/Keywords/Logout.robot
Resource    ../Ressources/Keywords/RechercherProduit.robot

*** Variables ***
${vUrl}    http://tutorialsninja.com/demo/index.php?route=common/home
${TIMEOUT}    5   
${vBrowser}    chrome
${vUsername}    JSmith@yahoo.com
${vPassword}    JSmith2022
${vProduit}    Samsung


*** Test Cases ***
Test case Rechercher Produit
    Login    ${vUrl}    ${vBrowser}    ${vUsername}    ${vPassword}
    Recherche Produit    ${vProduit}
    Logout



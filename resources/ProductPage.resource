*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
ProductPage.Click Products Button
    Click Element    xpath=//a[contains(text(),'Products')]

ProductPage.Verify All Products Page is Visible
    Page Should Contain    All Products

ProductPage.Search Product
    [Arguments]    ${product_name}
    Wait Until Element Is Visible   id=search_product
    Input Text    id=search_product    ${product_name}
    Click Element    id=submit_search

ProductPage.Verify Searched Products Visible
    Page Should Contain      Searched Products
    Page Should Contain    ${product_name}

ProductPage.Click View Product Button
    [Arguments]    ${PRODUCT_Index1}
    Click Element   xpath= (//a[contains(text(),'View Product')])[${PRODUCT_Index1}]
    Sleep    5s

#     checnge eli 3amli fl ba2i
#    [Arguments]    ${product_index}
#    ${xpath}=    Set Variable    (//a[contains(text(),'Add to cart')])[${product_index}]
##    Wait Until Element Is Visible    ${xpath}    10s
#    Click Element    ${xpath}

ProductPage.Verify Product Detail Opened
    Element Should Be Visible    xpath=//div[@class='product-details']

ProductPage.Increase Quantity
    [Arguments]    ${quantity}
    Input Text    name=quantity    ${quantity}

ProductPage.Verify Write Your Review Visible
    Page Should Contain    Write Your Review

ProductPage.Enter Review Details
    [Arguments]    ${name}    ${email}    ${review}
    Input Text    id=name    ${name}
    Input Text    id=email    ${email}
    Input Text    id=review    ${review}

ProductPage.Click Submit Button
    Click Element    id=button-review

ProductPage.Verify Brands Visible
    Element Should Be Visible    xpath=//h2[contains(text(),'Brands')]

ProductPage.Click Brand
    [Arguments]    ${brand_name}
    Click Element    css:a[href*='brand_products/${brand_name}']         #xpath=//a[contains(text(),'${brand_name}')]

ProductPage.Verify Brand Page
    [Arguments]    ${brand_name}
    Element Should Be Visible    xpath=//h2[contains(text(),'Brand - ${brand_name} Products')]
    
ProductPage.Verify Categories Visible
    Element Should Be Visible    xpath=//h2[text()='Category']    

ProductPage.Click Category
    [Arguments]    ${category_name}
#    Click Element    xpath=//a[contains(text(),'${category_name}')]
    Scroll Element Into View    (//a[contains(text(),'Add to cart')])[1]
    Wait Until Element Is Visible    //*[@id='accordian']/*[@class='panel panel-default'][1]                #//*[@class ='col-sm-3']/*[@class ='left-sidebar']/*[@id='accordian']/*[@class='panel panel-default'][1]    timeout=15s
    Sleep    2s
    Click Element    xpath=//*[@id='accordian']/*[@class='panel panel-default'][1]/*[1]//*[@class='fa fa-plus']                          #//*[@class ='col-sm-3']/*[@class ='left-sidebar']/*[@id='accordian']/*[@class='panel panel-default'][1]


ProductPage.Click Sub-Category
    [Arguments]    ${subcategory_name}
    Wait Until Element Is Visible    xpath=//*[@id='accordian']/*[@class='panel panel-default'][1]//*[contains(text(),'${subcategory_name}')]
    #//*[@id='accordian']/*[@class='panel panel-default'][1]//*[@class='panel-body']/*[1]/*[1]
    #(//a[contains(text(),'${subcategory_name}')])[1]
    #//*[@id='accordian']/*[@class='panel panel-default'][1]//*[contains(text(),'Dress')]
    Click Element    xpath=//*[@id='accordian']/*[@class='panel panel-default'][1]//*[contains(text(),'${subcategory_name}')]
    #xpath=//*[@id='accordian']/*[@class='panel panel-default'][1]//*[@class='panel-body']/*[1]/*[1]/a                #(//a[contains(text(),'${subcategory_name}')])[1]
    #//*[@class ='col-sm-3']/*[@class ='left-sidebar']/*[@id='accordian']/*[@class='panel panel-default'][1]//*[@class='panel-body']/*[1]/*[1]
    #//*[@id='accordian']/*[@class='panel panel-default'][1]//*[@class='panel-body']/*[1]/*[1]    # enhancement using id first

ProductPage.Verify Category Page
    [Arguments]    ${category_name}         ${subcategory_name}
#    Element Text Should Be    xpath=//h2[contains(text(),'${category_name}')]    ${category_name} Products
    ${category_text}    Set Variable    ${category_name} - ${subcategory_name} Products
    ${xpath}    Set Variable    //h2[contains(text(),"${category_text}")]
    Element Should Be Visible    xpath=${xpath}
    #    Page Should Contain    ${category_name} - ${subcategory_name} PRODUCTS

ProductPage.Click Add to Cart Button
    Click Element    xpath=//button[contains(@class,'cart')]
    Sleep    2s
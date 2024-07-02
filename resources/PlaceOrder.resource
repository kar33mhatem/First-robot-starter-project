*** Settings ***
Library           SeleniumLibrary

*** Variables ***

${DOWNLOAD_INVOICE_BUTTON}  css:a[href="/download_invoice"]
${DOWNLOAD_PATH}  ${TEMPDIR}  # Adjust this based on your system's temporary directory

*** Keywords ***
DownloadInvoice
    Click Element    ${DOWNLOAD_INVOICE_BUTTON}
    Capture Page Screenshot    ${DOWNLOAD_PATH}/invoice.png

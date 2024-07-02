from playwright.sync_api import sync_playwright

def run(playwright):
    # Define the path to your Adblock extension
    path_to_extension = "/TestCases/resources\\uBlock-Origin"

    # Launch the browser with the extension
    browser = playwright.chromium.launch(headless=False, args=[f"--disable-extensions-except={path_to_extension}", f"--load-extension={path_to_extension}"])
    context = browser.new_context()
    page = context.new_page()

    # Open a new page to verify the Adblock extension
    # page.goto("https://example.com")
    # page.screenshot(path="example.png")
    # browser.close()

with sync_playwright() as playwright:
    run(playwright)
# ______________
# from Browser import Browser
# from Browser import SupportedBrowsers
# from Browser import AssertionOperator as AO
#
# browser = Browser()
#
#
# def test_keyword_filtering():
#     browser.new_browser(SupportedBrowsers.chromium, headless=False)
#     browser.new_page("https://robotframework-browser.org/")
#
# _________________________________________________________________________
# try:
#      import Browser
#     print("Browser library imported successfully!")
# except ModuleNotFoundError:
#     print("Browser library not found.")
# ___________________________________________________________________________________________
# from selenium import webdriver
#
# class WebDriverProfile:
#     def create_web_driver_with_addons(self):
#         extension_location='d:\\First-robot-starter-project\\resources\\uBlock0_1.58.1b11.firefox.signed.xpi'
#         browser = webdriver.Firefox()
#         browser.install_addon(extension_location, temporary=True)
#         browser.get('https://automationexercise.com/')
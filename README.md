
# 🛠️ E-Commerce Automation Suite Using Robot Framework

## 📄 Project Overview

This project automates testing for the [Automation Exercise E-Commerce Website](http://automationexercise.com) using the **Robot Framework**. It focuses on testing the key functionalities of an online shopping platform The suite includes end-to-end test cases including product listing, cart operations, checkout, and invoice downloads. It is designed to ensure the correctness of a shopping website and is structured into modular test resources and suites.


The project is structured into resource files for different page objects and corresponding test cases, allowing for efficient and reusable test automation.

## 🔥 Features

- **End-to-End Test Automation**: Automates the entire customer journey, from product browsing to checkout and invoice verification.
- **Modular Keyword-Driven Testing**: Uses Robot Framework's keyword-driven testing approach, with keywords stored in separate resource files.
- **File Download Verification**: Ensures the invoice is correctly downloaded after completing an order.
- **Data-Driven Testing**: Supports testing with external data (e.g., address, reviews) stored in `.txt` files.
- **Reports & Logs**: Automatically generates test reports and logs for every test run.

## 🚀 Project Structure

```bash
├── resources
│   ├── CartPage.resource         # Keywords and functions for Cart Page interactions
│   ├── CheckoutPage.resource     # Keywords for Checkout and Invoice functionalities
│   ├── HomePage.resource         # Keywords for Home Page interactions
│   ├── PlaceOrder.resource       # Keywords for placing an order
│   ├── ProductPage.resource      # Keywords for Product Page interactions
│   ├── RegistrationPage.resource # Keywords for User Registration
│   ├── uploadfile.pdf            # Sample PDF used in file upload tests
│   ├── test_data.resource        # Test data for various use cases
│   ├── review_data.txt           # Review data for testing product reviews
│   └── address_data.txt          # Address data used during checkout
├── testcases
│   ├── TestSuite.robot           # All test cases organized into a suite
├── downloads                     # Folder for storing downloaded files (e.g., invoices)
├── reports                       # Reports and logs generated after each test run
├── variables.robot               # Centralized variable declarations
├── README.md                     # This readme file
└── requirements.txt              # Dependencies for the project
```

## 📄 Test Cases [Suite] Overview

All test cases are located in the `testcases` directory and are defined in the `TestSuite.robot` file. Each test is modular and leverages keywords defined in the `resources` folder to interact with the application.

Key test cases include:



- **Add Products to Cart**: Test adding multiple products to the cart and verifying their prices and quantities.
- **Checkout Process**: Test the end-to-end checkout process, including selecting products, entering addresses, and placing an order.
- **Invoice Download**: Verify that the invoice is correctly downloaded after placing an order.
- **Registration and Login**: Tests for user registration, login, and form validation.
- **Product Reviews**: Ensure that reviews can be added to products and verified during checkout.
- **File Upload**: Test cases for uploading files during the checkout process (e.g., uploading identification documents).
- **Home Page Interactions**: Verifying page elements, navigation, and user login functionality.
- **Product Search & Add to Cart**: Searching for products, adding items to the cart, and verifying cart contents.
- **Checkout Process**: Testing the full checkout process, from cart review to invoice generation.


## 📦 Dependencies

The project requires a few dependencies, which are listed in the `requirements.txt` file. You can install them using `pip`:

```bash
pip install -r requirements.txt
```

Key dependencies include:
- **Robot Framework**: The core test automation framework.
- **SeleniumLibrary**: To interact with web elements.
- **OperatingSystem**: For file system interactions (e.g., verifying invoice downloads).

## 🧪 Running the Tests

To run the test suite, execute the following command in the root directory:

```bash
robot -d reports testcases/TestSuite.robot
```

This will:
- Execute all test cases in `TestSuite.robot`.
- Generate reports and logs in the `reports/` directory.

## 🗂️ Key Resources

### CartPage.resource
Contains keywords for verifying cart functionalities, such as adding products, verifying quantities, and checking prices.

### CheckoutPage.resource
Handles checkout operations, including address entry, order placement, and verifying invoice downloads.

### HomePage.resource
Keywords for navigating and interacting with the homepage, such as searching for products and accessing categories.

### ProductPage.resource
Manages interactions on the product page, such as viewing product details, adding reviews, and selecting options.

### RegistrationPage.resource
Handles user registration and login functionalities, with keywords for filling out forms and validating input.

## 📥 Verifying Invoice Download

One of the key features is verifying that an invoice is downloaded after an order is placed. Here's how this is handled in the `CheckoutPage.resource`:

```robotframework
CheckoutPage.Verify Invoice Downloaded
    [Documentation]    Verifies the invoice is downloaded successfully and is located in the specified folder with the name invoice.
    
    # Trigger the invoice download
    Click Element    xpath=//button[contains(text(), 'Download Invoice')]  
    
    # Wait for the download to complete
    Wait Until Invoice Is Downloaded
    
    # Verify the invoice file exists in the downloads folder
    ${file_path}=    Set Variable    ${DOWNLOAD_FOLDER}/${INVOICE_FILE_NAME}
    File Should Exist    ${file_path}
```

## 📝 Reports and Logs

After running the test cases, detailed reports and logs are generated automatically. These can be found in the `reports/` folder and include:

- **Log.html**: Detailed execution logs of the tests.
- **Report.html**: Summary report with test results.
- **Output.xml**: Machine-readable test results.

## 👨‍💻 Contributing

If you'd like to contribute to this project, feel free to fork the repository, make your changes, and submit a pull request. Contributions are welcome!

---

**Author**: [Kareem Hatem]

**Contact**: kar333mhatem@gmail.com

Feel free to check out other projects in my [GitHub Portfolio](https://github.com/kar33mhatem).


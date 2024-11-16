
# Setup Script for Git, Python, Playwright, Selenium, Firefox, and Chrome WebDriver on Android - https://blog.lowlevelforest.com/

This repository contains a bash script to automatically check and install the necessary tools for web scraping and automation on an Android device using Termux. The script ensures that Git, Python 3.12, Playwright, Selenium, Firefox, and Chrome WebDriver are installed and configured correctly.

## Requirements

- **Termux** app installed on your Android device.
- An internet connection for downloading packages and dependencies.
- Root access may be required for certain operations.

## Features

- Installs and configures **Git**, **Python 3.12**, **Playwright**, **Selenium**, **Firefox**, and **Chrome WebDriver**.
- Automatically handles dependencies and installs the necessary packages.
- Verifies and upgrades the tools to the latest versions.

## Prerequisites

Before running the script, make sure you have the following installed:

1. **Termux**: Install from [Termux on F-Droid](https://f-droid.org/packages/com.termux/) or Google Play.
2. **GitHub Account**: To clone this repository and upload changes.

## Installation

### 1. Install Termux on Your Android Device

If you haven't already installed Termux, download and install it from the Google Play Store or F-Droid.

### 2. Clone this Repository

Open Termux and run the following command to clone this repository:

```bash
git clone https://github.com/coffeecms/android_auto_install_playwright_selenium.git
```

### 3. Navigate to the Project Directory

Navigate into the cloned directory:

```bash
cd repository-name
```

### 4. Make the Script Executable

Ensure the script is executable by running the following command:

```bash
chmod +x setup_script.sh
```

### 5. Run the Script

Execute the script to install the required tools:

```bash
./setup_script.sh
```

The script will automatically check and install:

- **Git**
- **Python 3.12**
- **Playwright**
- **Selenium**
- **Firefox**
- **Chrome WebDriver**

### 6. Verify the Installation

After the script finishes running, you can verify that all tools have been installed successfully by running:

```bash
git --version
python3 --version
pip show playwright
pip show selenium
chromium --version
```

You should see the version details for each tool.

## Script Explanation

### 1. Git Installation

The script first checks if Git is installed using:

```bash
if ! command -v git &> /dev/null
then
    pkg update -y && pkg install git -y
fi
```

If Git is not found, it installs it using `pkg install git`.

### 2. Python 3.12 Installation

It checks if Python 3.12 is installed:

```bash
if ! command -v python3 &> /dev/null
then
    pkg install python -y
fi
```

If Python is missing, it installs it.

### 3. Playwright and Selenium Installation

Playwright and Selenium are installed using `pip`:

```bash
pip install playwright
pip install selenium
```

The script will install these dependencies if they are not already installed.

### 4. Firefox and Chromium Installation

- **Firefox** is installed using:

  ```bash
  pkg install firefox -y
  ```

- **Chromium (Chrome)** is installed with:

  ```bash
  pkg install chromium -y
  ```

After installing Chromium, the script checks the version of Chromium and installs the corresponding **ChromeDriver** using:

```bash
wget https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv chromedriver /usr/local/bin/
```

## Example Usage

Once the setup is complete, you can use Playwright and Selenium to automate web tasks in Python. Below is an example Python script using **Selenium** and **Playwright**.

### Example: Selenium with Chrome WebDriver

```python
from selenium import webdriver

# Set up Chrome WebDriver
driver = webdriver.Chrome()

# Open a webpage
driver.get('https://www.example.com')

# Print the title of the page
print(driver.title)

# Close the browser
driver.quit()
```

### Example: Playwright

```python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto('https://www.example.com')
    print(page.title())
    browser.close()
```

## Troubleshooting

- **Issue: Playwright fails to launch browser**  
  Make sure you have installed the correct browser binaries using Playwright by running `playwright install`.

- **Issue: Missing dependencies**  
  Ensure your Termux installation is up to date by running `pkg update` before running the script.

## Contributing

If you'd like to contribute to this project, feel free to fork the repository, make changes, and create a pull request. Contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
# android_auto_install_playwright_selenium
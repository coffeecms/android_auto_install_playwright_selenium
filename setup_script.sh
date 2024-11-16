#!/bin/bash

# Kiểm tra và cài đặt Git
if ! command -v git &> /dev/null
then
    echo "Git chưa được cài đặt. Đang cài đặt..."
    pkg update -y && pkg install git -y
else
    echo "Git đã được cài đặt."
fi

# Kiểm tra và cài đặt Python 3.12
if ! command -v python3 &> /dev/null
then
    echo "Python chưa được cài đặt. Đang cài đặt Python 3.12..."
    pkg update -y && pkg install python -y
else
    echo "Python đã được cài đặt."
fi

# Kiểm tra phiên bản Python
python_version=$(python3 --version 2>&1)
if [[ "$python_version" != "Python 3.12"* ]]; then
    echo "Cần cài đặt Python 3.12, đang nâng cấp..."
    pkg install python3 -y
    # Có thể cần thêm bước cài đặt Python 3.12 theo yêu cầu cụ thể cho Termux
fi

# Cài đặt Playwright (sử dụng pip để cài đặt)
if ! pip show playwright &> /dev/null
then
    echo "Playwright chưa được cài đặt. Đang cài đặt..."
    pip install playwright
else
    echo "Playwright đã được cài đặt."
fi

# Cài đặt Selenium (sử dụng pip để cài đặt)
if ! pip show selenium &> /dev/null
then
    echo "Selenium chưa được cài đặt. Đang cài đặt..."
    pip install selenium
else
    echo "Selenium đã được cài đặt."
fi

# Cài đặt Firefox (đối với Termux, bạn sẽ cần tải Firefox từ kho phần mềm Android hoặc cài đặt thủ công)
echo "Đang cài đặt Firefox..."
pkg install firefox -y

# Cài đặt Chrome WebDriver (Đảm bảo rằng bạn đã cài đặt Chrome trước)
echo "Đang cài đặt Chrome WebDriver..."
pkg install chromium -y
CHROME_VERSION=$(chromium --version | awk '{print $2}')
echo "Chrome version: $CHROME_VERSION"

# Cài đặt ChromeDriver tương ứng với phiên bản Chrome
CHROME_DRIVER_VERSION=$(curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION)
echo "Cài đặt ChromeDriver version: $CHROME_DRIVER_VERSION"
wget https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv chromedriver /usr/local/bin/

# Kiểm tra cài đặt
echo "Kiểm tra cài đặt:"
git --version
python3 --version
pip show playwright
pip show selenium
chromium --version

#!/bin/bash

# Màu sắc trong terminal
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# In thông báo tùy biến
echo "${RED}Chào mừng bạn đến với Termux!${RESET}"
echo "${GREEN}Hôm nay là: $(date +"%d/%m/%Y %H:%M:%S")${RESET}"
echo "${YELLOW}Bạn có thể bắt đầu làm việc ngay bây giờ.${RESET}"
echo "${BLUE}Chúc bạn một ngày tốt lành!${RESET}"
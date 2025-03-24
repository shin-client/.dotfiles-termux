#!/bin/bash

# Tên file C++ cần biên dịch
file_name="$1"

# Kiểm tra xem file có tồn tại hay không
if [ ! -f "$file_name" ]; then
  echo "File '$file_name' not found."
  exit 1
fi

# Biên dịch file C++
g++ "$file_name" -o "${file_name%.*}"

# Kiểm tra xem biên dịch có thành công hay không
if [ $? -eq 0 ]; then
  echo "Compilation successful."

  # Chạy file thực thi
  ./"${file_name%.*}"
else
  echo "Compilation failed."
  exit 1
fi
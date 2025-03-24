#!/bin/bash
pkg install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Đường dẫn đến file .zshrc
ZSHRC_FILE="$HOME/.zshrc"

# Các plugin muốn thêm
NEW_PLUGINS=(
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"
  "web-search"
  "colored-man-pages"
  "command-not-found"
)

# Kiểm tra xem file .zshrc có tồn tại không
if [[ ! -f "$ZSHRC_FILE" ]]; then
  echo "File .zshrc không tồn tại!"
  exit 1
fi

# Đọc nội dung file .zshrc
PLUGINS_LINE=$(grep -E "^plugins=" "$ZSHRC_FILE")

# Nếu không tìm thấy dòng plugins=, thêm vào cuối file
if [[ -z "$PLUGINS_LINE" ]]; then
  echo "plugins=(${NEW_PLUGINS[*]})" >> "$ZSHRC_FILE"
  echo "Đã thêm plugins vào .zshrc!"
  exit 0
fi

# Lấy danh sách plugin hiện tại
CURRENT_PLUGINS=$(echo "$PLUGINS_LINE" | sed -E "s/^plugins=\((.*)\)/\1/")

# Thêm các plugin mới vào danh sách hiện tại (nếu chưa có)
for PLUGIN in "${NEW_PLUGINS[@]}"; do
  if [[ ! "$CURRENT_PLUGINS" =~ "$PLUGIN" ]]; then
    CURRENT_PLUGINS+=" $PLUGIN"
  fi
done

# Cập nhật dòng plugins= trong file .zshrc
sed -i.bak -E "s/^plugins=\(.*\)/plugins=($CURRENT_PLUGINS)/" "$ZSHRC_FILE"

echo "Đã cập nhật plugins trong .zshrc!"
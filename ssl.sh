#!/bin/bash

# Yêu cầu nhập domain từ bàn phím
echo "Nhập domain:"
read DOMAIN

# Kiểm tra domain không được rỗng
if [ -z "$DOMAIN" ]; then
    echo "Domain không được để trống. Vui lòng thử lại."
    exit 1
fi

# Thư mục lưu CSR và private key
OUTPUT_DIR="certs/$DOMAIN"
mkdir -p "$OUTPUT_DIR"

# Tên file CSR và private key
CSR_FILE="$OUTPUT_DIR/$DOMAIN.csr"
KEY_FILE="$OUTPUT_DIR/$DOMAIN.key"

# Tạo private key và file CSR
openssl req -new \
    -newkey rsa:2048 \
    -nodes \
    -keyout "$KEY_FILE" \
    -out "$CSR_FILE" \
    -subj "/C=VN/ST=HCM/L=HCM/O=HCM/OU=IT/CN=$DOMAIN"

# Kiểm tra kết quả
if [ $? -eq 0 ]; then
    echo "File CSR và private key đã được tạo thành công:"
    echo "- CSR: $CSR_FILE"
    echo "- Private key: $KEY_FILE"
else
    echo "Có lỗi xảy ra trong quá trình tạo file CSR."
    exit 1
fi
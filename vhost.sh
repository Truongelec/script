#!/bin/bash

# Yêu cầu người dùng nhập ServerName
read -p "Nhập ServerName (ví dụ: example.com): " domain
OUTPUT_DIR="vhost_file"
mkdir -p "$OUTPUT_DIR"

# Thư mục chứa tệp SSL
ssl_dir="C:/xampp/apache/ssl/$domain"

# Xuất nội dung cấu hình ra tệp: vhost.conf
cat <<EOF > "$OUTPUT_DIR/$domain.conf"
<VirtualHost *:443>
    DocumentRoot "C:/xampp/htdocs"
    ServerName $domain

    SSLEngine on
    SSLCertificateFile "$ssl_dir/certificate.crt"
    SSLCertificateKeyFile "$ssl_dir/private.key"
    SSLCACertificateFile "$ssl_dir/ca_bundle.crt"
</VirtualHost>
EOF

echo "Tệp cấu hình VirtualHost đã được tạo tại: $OUTPUT_DIR/$domain.conf"

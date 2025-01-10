#!/bin/bash

show_menu() {
    echo "============================="
    echo "Lựa chọn của bạn:"
    echo "1. Hiển thị danh sách Database và User"
    echo "2. Tạo user mới"
    echo "3. remote sql" 
    echo "4. Thoát"
    echo "============================="
    read -p "Nhập lựa chọn (1/2/3): " choice
}

show_db_and_user() {
    echo "============================="
    echo "Danh sách lệnh để hiển thị Database và User:"
    echo "SHOW DATABASES;"
    echo "SELECT user, host FROM mysql.user;"
    echo "============================="
}

create_user() {
    echo "============================="
    read -p "Nhập tên Database: " db_name
    read -p "Nhập tên User: " user_name
    read -sp "Nhập Password: " user_pass
    echo
    echo "============================="
    echo "Lệnh tạo user trên MySQL là:"
    echo "CREATE USER '$user_name'@'localhost' IDENTIFIED BY '$user_pass';"
    echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$user_name'@'localhost';"
    echo "FLUSH PRIVILEGES;"
    echo "============================="
}
configure_remote_sql() {
    echo "============================="
    read -p "Nhập địa chỉ IP client (ví dụ: 192.168.1.100): " client_ip
    read -p "Nhập tên User MySQL: " user_name
    read -sp "Nhập Password cho User: " user_pass
    echo
    read -p "Nhập tên Database cần cấp quyền (nhập * để cấp quyền toàn bộ): " db_name
    echo "============================="
    echo "Lệnh cấu hình Remote SQL:"
    echo "CREATE USER '$user_name'@'$client_ip' IDENTIFIED BY '$user_pass';"
    echo "GRANT ALL PRIVILEGES ON ${db_name}.* TO '$user_name'@'$client_ip';"
    echo "FLUSH PRIVILEGES;"
    echo "============================="
}

while true; do
    show_menu
    case $choice in
        1)
            show_db_and_user
            ;;
        2)
            create_user
            ;;
        3)
            configure_remote_sql
        
            ;;
        4) 
            echo "Thoát chương trình."
            exit 0
            ;;
        *)
            echo "Lựa chọn không hợp lệ, vui lòng chọn lại."
            ;;
    esac
done

#!/usr/bin/env bash

cd `dirname $BASH_SOURCE`

if [ ! -f .env ]; then
    echo "Sao chép .env.example sang .env..."
    cp .env.example .env
else
    echo "File .env đã tồn tại."
fi


# Dừng và xóa các container đang chạy
docker-compose -p taskingai down

# Kéo phiên bản mới nhất của các image từ registry
docker-compose -p taskingai pull

# Khởi chạy lại container với cấu hình từ .env trong chế độ nền
docker-compose -p taskingai --env-file .env up -d
#docker-compose stop
#docker-compose rm -f
#docker-compose pull
#docker-compose up -d

cd - > /dev/null

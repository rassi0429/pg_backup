#!/bin/bash

# 現在の日付を取得
CURRENT_DATE=$(date +%Y%m%d)

# Dockerコンテナ内でpg_dumpallを実行し、結果をxzで圧縮して外部ファイルに保存
docker compose exec -T db pg_dumpall -U $POSTGRES_USER | xz -3 > ${BACKUP_DIR}/${CURRENT_DATE}.sql.xz

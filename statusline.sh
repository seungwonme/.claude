#!/bin/bash

# "statusLine": {
#   "type": "command",
#   "command": ".claude/statusline.sh",
#   "padding": 0
# }

# JSON 입력을 한 번 읽기
input=$(cat)

# 일반적인 추출을 위한 헬퍼 함수
get_model_name() { echo "$input" | jq -r '.model.display_name'; }
get_current_dir() { echo "$input" | jq -r '.workspace.current_dir'; }
get_project_dir() { echo "$input" | jq -r '.workspace.project_dir'; }
get_version() { echo "$input" | jq -r '.version'; }

# 헬퍼 사용
MODEL=$(get_model_name)
DIR=$(get_current_dir)
echo -e "\033[0;104mdemodev\033[0m [$MODEL] 📁 ${DIR##*/}"

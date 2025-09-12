<user_system_prompt>

# 시스템 환경

```bash
system_profiler SPSoftwareDataType

Software:

    System Software Overview:

      System Version: macOS 15.6.1 (24G90)
      Kernel Version: Darwin 24.6.0
      Boot Volume: Macintosh HD
      Boot Mode: Normal
      Computer Name: Aiden’s MacBook Pro
      User Name: Aiden Ahn (seungwonan)
      Secure Virtual Memory: Enabled
      System Integrity Protection: Enabled
      Time since boot: 9 days, 18 hours, 2 minutes
```

# 출력

1. 과잉 칭찬을 하지 말고 최대한 객관적인 사실을 기반으로 답변해줘.
2. UTF-8 한국어 인코딩 신경써

# 다른 AI Agent와의 커뮤니케이션

- `gemini -p <prompt>`
- `claude -p <prompt>`
- `qwen -p <prompt>`
- `codex e --skip-git-repo-check <prompt>`

# 프로그래밍

## 패키지 매니저

1. `npm` 대신 `pnpm` 사용
2. `npx` 대신 `bunx` 사용
3. `pip` 대신 `uv` 사용

## 터미널 명령어

- rm: `trash-cli`로 alias 되어있기 때문에 아무런 옵션도 넣지 말고 (rm -r, rm -rf ..) `rm`만 사용해.
- cp: `cpq`로 alias 되어있기 때문에 아무런 옵션도 넣지 말고 (cp -r, cp -rf ..) `cpq`만 사용해.
- mv: `mvq`로 alias 되어있기 때문에 아무런 옵션도 넣지 말고 (mv -r, mv -rf ..) `mvq`만 사용해.

## 린터/포메터

### JS

- `eslint`, `prettier` 대신 `biome` 사용
  - 규칙 업데이트 시 biome 설정 파일을 변경하지말고 eslint, prettier 설정 파일을 변경하고 `biome migrate` 명령어를 사용

</user_system_prompt>

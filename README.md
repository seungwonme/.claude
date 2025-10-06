# .Claude

## AGENTS.md

```sh
ln -s ~/AGENTS.md AGENTS.md
```

명령어로 codex, gemini cli, opencode, cursor 등에서 사용하는 기반 문서를 심볼릭 링크로 현재 디렉토리에 생성합니다.
그 후 CLAUDE.md 파일에 AGENTS.md를 참조하도록 설정합니다.

## .claude.json

```sh
ln -s ~/.claude.json .claude.json
```

명령어로 현재 디렉토리에 .claude.json의 심볼릭 링크를 생성합니다.

### 전역 MCP 설정

```json
"mcpServers": {
  "context7": {
    "command": "bunx",
    "args": ["@upstash/context7-mcp"]
  }
}
...
```

프로젝트에 종속되지 않은 뎁스에서 "mcpServers" 설정을 추가하면 전역적으로 사용할 수 있습니다.
프로젝트에서 사용하는 mcp 도구는 .mcp.json 파일에 설정합니다.

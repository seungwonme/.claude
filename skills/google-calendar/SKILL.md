---
name: google-calendar
description: Google 캘린더 일정 조회/생성/수정/삭제. "오늘 일정", "이번 주 일정", "미팅 추가해줘" 요청에 사용. 여러 계정(work, personal) 통합 조회 지원.
---

# Google Calendar Skill

Manage calendar events through Google Calendar API - fetch, create, update, delete across multiple Google accounts.

## Account Setup

**Before running any command, check registered accounts in `accounts/`.**

> If `accounts/` is empty → Read `references/setup-guide.md` for initial setup

```bash
ls .claude/skills/google-calendar/accounts/
# → work.json, personal.json, executive.json
```

## Event Fetch Workflow (3 Steps)

When fetching events, run **parallel SubAgents** per account:

| Step | Task | Key Action |
|------|------|------------|
| 1 | Check accounts | `ls accounts/` → identify all registered accounts |
| 2 | Parallel fetch | Run SubAgent **per account**: `fetch_events.py --account {name} --days 7` |
| 3 | Merge & display | Sort by time, detect conflicts (overlapping across accounts), group by date |

### Workflow Example: "이번 주 일정 알려줘"

```
1. ls accounts/ → work.json, personal.json
2. Parallel SubAgents:
   - Task: uv run python scripts/fetch_events.py --account work --days 7
   - Task: uv run python scripts/fetch_events.py --account personal --days 7
3. Merge results → sort by time → detect conflicts → display
```

### Output Format

```
📅 2026-01-06 (월) 일정

[09:00-10:00] 🔵 팀 스탠드업 (work)
[14:00-15:00] 🔵 고객 미팅 (work)
              ⚠️ 충돌: 개인 일정과 겹침
[14:00-14:30] 🟢 은행 방문 (personal)

📊 오늘 총 3개 일정 (work: 2, personal: 1) | ⚠️ 1건 충돌
```

## Event Create Workflow (3 Steps)

| Step | Task | Key Action |
|------|------|------------|
| 1 | Parse request | Extract summary, start/end time, account from user request |
| 2 | Create event | Run `manage_events.py create --summary ... --start ... --end ... --account ...` |
| 3 | Open in browser | Parse `링크:` from output → `open "{url}"` |

### Workflow Example: "내일 3시에 work 캘린더에 팀 미팅 잡아줘"

```
1. Parse: summary="팀 미팅", start=2026-02-12T15:00:00, end=2026-02-12T16:00:00, account=work
2. uv run python scripts/manage_events.py create \
     --summary "팀 미팅" --start "2026-02-12T15:00:00" --end "2026-02-12T16:00:00" --account work
3. open "https://www.google.com/calendar/event?eid=abc123"
```

## CLI Quick Reference

```bash
# Fetch events
uv run python .claude/skills/google-calendar/scripts/fetch_events.py \
    --account work --days 7

# Create event
uv run python .claude/skills/google-calendar/scripts/manage_events.py create \
    --summary "팀 미팅" --start "2026-01-06T14:00:00" --end "2026-01-06T15:00:00" --account work

# Create all-day event
uv run python .claude/skills/google-calendar/scripts/manage_events.py create \
    --summary "연차" --start "2026-01-10" --end "2026-01-11" --account personal

# Update event
uv run python .claude/skills/google-calendar/scripts/manage_events.py update \
    --event-id "abc123" --summary "팀 미팅 (변경)" --start "2026-01-06T14:21:00" --account work

# Delete event
uv run python .claude/skills/google-calendar/scripts/manage_events.py delete \
    --event-id "abc123" --account work
```

### Options

| Option | Description |
|--------|-------------|
| `--summary` | 일정 제목 |
| `--start` | 시작 시간 (ISO: `2026-01-06T14:00:00` or `2026-01-06`) |
| `--end` | 종료 시간 |
| `--description` | 일정 설명 |
| `--location` | 장소 |
| `--attendees` | 참석자 이메일 (쉼표 구분) |
| `--account` | 계정 (work, personal 등) |
| `--timezone` | 타임존 (기본값: Asia/Seoul) |
| `--json` | JSON 형식 출력 |

## View Event in Web

After create/update, parse the `링크:` from script output and open in browser:

```bash
# Script output example:
# ✅ 일정 생성 완료
#    링크: https://www.google.com/calendar/event?eid=abc123

# Open in browser
open "https://www.google.com/calendar/event?eid=abc123"
```

## File Structure

```
skills/google-calendar/
├── SKILL.md
├── scripts/
│   ├── calendar_client.py      # API client library
│   ├── setup_auth.py           # OAuth setup
│   ├── fetch_events.py         # Event fetch CLI
│   └── manage_events.py        # Event CRUD CLI
├── references/
│   ├── setup-guide.md          # Initial setup guide
│   └── credentials.json        # OAuth Client ID (gitignore)
└── accounts/                   # Per-account tokens (gitignore)
```

## Error Handling

| Situation | Resolution |
|-----------|------------|
| accounts/ empty | Read `references/setup-guide.md` for initial setup |
| Token missing | Guide user to run `setup_auth.py --account <name>` |
| Token expired | Auto-refresh; if failed, guide re-authentication |
| API quota exceeded | Retry after short delay |

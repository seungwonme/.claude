---
name: notion
description: Notion workspace automation — search, create, update, and organize pages. Routes to the appropriate sub-skill. Trigger on "notion", "노션", "회의 준비", "meeting prep", "지식 정리", "문서화", "리서치", "스펙 구현", "spec to tasks". Sub-skills — meeting-intelligence (meeting prep with pre-read + agenda, "회의 준비", "미팅 자료"), knowledge-capture (conversation to structured docs, "노션에 저장", "문서화해줘", "위키에 추가"), research-documentation (search + synthesize + report, "노션 검색", "조사해줘", "리서치 정리"), spec-to-implementation (spec breakdown into tasks, "스펙 구현", "태스크 분해", "구현 계획").
---

# Notion: Workspace Automation Router

Route to the correct sub-skill based on the user's need. All sub-skills use Notion MCP tools (`Notion:notion-search`, `Notion:notion-fetch`, `Notion:notion-create-pages`, `Notion:notion-update-page`).

## Sub-skill Selection

| Sub-skill                  | When                                                    | Read                                  |
| -------------------------- | ------------------------------------------------------- | ------------------------------------- |
| **meeting-intelligence**   | Prep meeting materials (pre-read + agenda)              | `meeting-intelligence/SKILL.md`       |
| **knowledge-capture**      | Save conversation/insights as structured Notion docs    | `knowledge-capture/SKILL.md`          |
| **research-documentation** | Search Notion, synthesize findings, create reports      | `research-documentation/SKILL.md`     |
| **spec-to-implementation** | Break specs into tasks with implementation tracking     | `spec-to-implementation/SKILL.md`     |

## Decision Logic

1. **Meeting coming up** → `meeting-intelligence` (create pre-read + agenda from Notion context)
2. **Want to save knowledge** → `knowledge-capture` (conversation → structured wiki/database page)
3. **Need to research a topic** → `research-documentation` (search → synthesize → report)
4. **Have a spec to implement** → `spec-to-implementation` (spec → plan → tasks → progress tracking)

If unclear which sub-skill fits, use AskUserQuestion:

```
questions:
  - question: "어떤 Notion 작업이 필요한가요?"
    header: "유형"
    options:
      - label: "회의 준비"
        description: "Notion 컨텍스트를 기반으로 내부 사전 자료 + 외부 안건 생성"
      - label: "지식 저장"
        description: "대화 내용이나 인사이트를 구조화된 Notion 문서로 저장"
      - label: "리서치 정리"
        description: "Notion 검색 → 여러 페이지 종합 → 리서치 보고서 생성"
      - label: "스펙 구현"
        description: "스펙 문서를 구현 계획과 태스크로 분해하여 추적"
    multiSelect: false
```

After selection, read the corresponding sub-skill's SKILL.md and follow its protocol.

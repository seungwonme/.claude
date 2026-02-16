---
name: dev
description: Developer workflow tools for technical research, decision-making, and development practices. Routes to the appropriate sub-skill. Trigger on "기술 의사결정", "A vs B", "비교 분석", "라이브러리 선택", "아키텍처 결정", "뭐 쓸지 고민", "트레이드오프", "개발자 반응", "커뮤니티 의견", "리서치해줘", "모범 사례", "developer reactions", "tech decision", "tech research", "git convention", "커밋 메시지", "브랜치", "TDD", "테스트 주도", "Red-Green-Refactor", "vibe coding", "AI 개발". Sub-skills — tech-research (기술 리서치 & 의사결정: scan/research/decision 3가지 모드, "뭐 쓸지", "커뮤니티 의견", "리서치해줘", "모범 사례"), git-convention (Git branch naming and commit message conventions, "커밋 컨벤션", "브랜치 네이밍"), tdd (Test-Driven Development with Red-Green-Refactor cycle, "TDD", "테스트 먼저"), vibe-coding (AI-assisted development workflow with incremental implementation, "바이브 코딩", "AI 개발 워크플로우").
---

# Dev: Developer Workflow Router

Route to the correct sub-skill based on the user's need.

## Sub-skill Selection

| Sub-skill          | When                                                          | Read                      |
| ------------------ | ------------------------------------------------------------- | ------------------------- |
| **tech-research**  | 기술 리서치, 커뮤니티 의견, 구현 전 리서치, 기술 의사결정, 비교 분석 | `tech-research/SKILL.md`  |
| **git-convention** | Git 브랜치 네이밍, 커밋 메시지 컨벤션, 이슈 라벨 설정           | `git-convention/SKILL.md` |
| **tdd**            | TDD Red-Green-Refactor, Tidy First, 구조/행위 변경 분리        | `tdd/SKILL.md`            |
| **vibe-coding**    | AI 보조 개발 워크플로우, 점진적 구현, 에러 해결 루프            | `vibe-coding/SKILL.md`    |

## Decision Logic

1. **기술 리서치·비교·의사결정·커뮤니티 의견** → `tech-research` (3가지 모드: scan/research/decision)
2. **Git 컨벤션·브랜치·커밋 규칙이 필요** → `git-convention` (GitFlow + Conventional Commits)
3. **테스트 주도 개발이 필요** → `tdd` (Red-Green-Refactor + Tidy First)
4. **AI 보조 개발 워크플로우가 필요** → `vibe-coding` (점진적 구현 + 에러 해결 루프)

If unclear which sub-skill fits, use AskUserQuestion:

```
questions:
  - question: "어떤 개발 워크플로우가 필요한가요?"
    header: "유형"
    options:
      - label: "기술 리서치"
        description: "커뮤니티 의견 수집, 구현 전 모범 사례 조사, 기술 비교 의사결정"
      - label: "Git 컨벤션"
        description: "브랜치 네이밍, 커밋 메시지 규칙, 이슈 라벨 설정"
      - label: "TDD / Vibe Coding"
        description: "테스트 주도 개발 또는 AI 보조 개발 워크플로우"
    multiSelect: false
```

After selection, read the corresponding sub-skill's SKILL.md and follow its protocol.

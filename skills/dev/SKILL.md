---
name: dev
description: Developer workflow tools for technical research, decision-making, and development practices. Routes to the appropriate sub-skill. Trigger on "기술 의사결정", "A vs B", "비교 분석", "라이브러리 선택", "아키텍처 결정", "뭐 쓸지 고민", "트레이드오프", "개발자 반응", "커뮤니티 의견", "developer reactions", "tech decision", "git convention", "커밋 메시지", "브랜치", "TDD", "테스트 주도", "Red-Green-Refactor", "vibe coding", "AI 개발". Sub-skills — tech-decision (systematic technical decision analysis with multi-source research, "뭐 쓸지", "어떤 걸 써야 할지"), dev-scan (developer community opinion scanning from Reddit/HN/Dev.to/Lobsters, "개발자 반응", "커뮤니티 의견"), git-convention (Git branch naming and commit message conventions, "커밋 컨벤션", "브랜치 네이밍"), tdd (Test-Driven Development with Red-Green-Refactor cycle, "TDD", "테스트 먼저"), vibe-coding (AI-assisted development workflow with incremental implementation, "바이브 코딩", "AI 개발 워크플로우").
---

# Dev: Developer Workflow Router

Route to the correct sub-skill based on the user's need.

## Sub-skill Selection

| Sub-skill          | When                                                          | Read                      |
| ------------------ | ------------------------------------------------------------- | ------------------------- |
| **tech-decision**  | 기술 의사결정, 라이브러리/아키텍처 비교 분석, 트레이드오프 평가 | `tech-decision/SKILL.md`  |
| **dev-scan**       | 개발 커뮤니티 의견 수집 (Reddit, HN, Dev.to, Lobsters)         | `dev-scan/SKILL.md`       |
| **git-convention** | Git 브랜치 네이밍, 커밋 메시지 컨벤션, 이슈 라벨 설정           | `git-convention/SKILL.md` |
| **tdd**            | TDD Red-Green-Refactor, Tidy First, 구조/행위 변경 분리        | `tdd/SKILL.md`            |
| **vibe-coding**    | AI 보조 개발 워크플로우, 점진적 구현, 에러 해결 루프            | `vibe-coding/SKILL.md`    |

## Decision Logic

1. **기술 선택·비교·의사결정이 필요** → `tech-decision` (체계적 분석 + 두괄식 보고서)
2. **커뮤니티 반응·의견 수집이 필요** → `dev-scan` (멀티 소스 스캔)
3. **Git 컨벤션·브랜치·커밋 규칙이 필요** → `git-convention` (GitFlow + Conventional Commits)
4. **테스트 주도 개발이 필요** → `tdd` (Red-Green-Refactor + Tidy First)
5. **AI 보조 개발 워크플로우가 필요** → `vibe-coding` (점진적 구현 + 에러 해결 루프)

If unclear which sub-skill fits, use AskUserQuestion:

```
questions:
  - question: "어떤 개발 워크플로우가 필요한가요?"
    header: "유형"
    options:
      - label: "기술 의사결정"
        description: "라이브러리 선택, 아키텍처 결정, 구현 방식 비교 등 체계적 분석"
      - label: "커뮤니티 의견 수집"
        description: "Reddit, HN 등 개발 커뮤니티에서 특정 주제에 대한 다양한 의견 스캔"
      - label: "Git 컨벤션"
        description: "브랜치 네이밍, 커밋 메시지 규칙, 이슈 라벨 설정"
      - label: "TDD / Vibe Coding"
        description: "테스트 주도 개발 또는 AI 보조 개발 워크플로우"
    multiSelect: false
```

After selection, read the corresponding sub-skill's SKILL.md and follow its protocol.

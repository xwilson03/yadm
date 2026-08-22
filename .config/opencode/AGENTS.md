# Style
- Be concise. No preamble, filler, or compliments
- Don't ask before low-risk actions, only before destructive/irreversible ones

# Code
- Show diffs instead of full files unless asked

# Formatting
- No em dashes
- No unicode characters except for when drawing visuals
- Always end files with a newline

# Procedure
- Gather direct evidence instead of theorizing
- Identify general rules instead of enumerating cases
- Implement in vertical slices rather than all-at-once
- Follow DRY/KISS/YAGNI
- Split features/systems that arent cohesive
- Plan top-down, focusing higher-level components first
- Implement bottom-up, focusing simpler pieces first
- Always target the "least uncertain" decision until its solved

# Memory (GrayMatter)
- Store with memory_add: stated preferences, project conventions not visible in code, non-trivial fixes and workarounds, decisions including the why
- Search with memory_search at session start using the task as query, before ambiguous decisions, and before redoing a past fix
- checkpoint_save before risky or multi-step changes; checkpoint_resume when picking work back up
- Fix or forget stale facts with memory_reflect
- Atomic facts only: no conversation logs, no large dumps, no secrets
- Single global store at ~/.graymatter for all projects; agent_id is always the lowercase name of the current project directory (Beholder -> beholder); CLI calls must pass --dir /home/xander/.graymatter

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->

# Agent Guidelines

## Commands

- Run /design when you are about to design a new module or feature.
- Run /feature when you are about to implement a new feature.
- Run /fix when you are about to provide a bugfix.
- Run /review when you are about to initiate a code review.

## Tools

- `flow`: for lint, formatting, and running tests
- `forge`: for releasing packages

## Code style

- Adopt
  [Roka coding conventions](https://raw.githubusercontent.com/withroka/roka/refs/heads/main/CONTRIBUTING.md).
- Write clean, maintainable, and minimal code.

### Examples

❌ Avoid unnecessary variables and comments

```ts
export function validate(input?: string): string | undefined {
  // Check if input exists
  const hasInput = input !== undefined;

  // If no input, return undefined
  if (!hasInput) {
    return undefined;
  }

  // Trim the input
  const trimmed = input.trim();

  // Return the result
  return trimmed;
}
```

✅ Prefer minimal code with early returns

```ts
export function validate(input?: string): string | undefined {
  if (!input) return undefined;
  return input.trim();
}
```

❌ Avoid nested conditions

```ts
export function process(value?: string): string | undefined {
  if (value !== undefined) {
    if (value.length > 0) {
      return value.toLowerCase();
    } else {
      return undefined;
    }
  } else {
    return undefined;
  }
}
```

✅ Prefer guard clauses

```ts
export function process(value?: string): string | undefined {
  if (!value || value.length === 0) return undefined;
  return value.toLowerCase();
}
```

❌ Avoid long variable names

```ts
export function parse(commitMessage?: string): string | undefined {
  const trimmedCommitMessage = commitMessage?.trim();
  const firstLineOfCommitMessage = trimmedCommitMessage?.split("\n")[0];
  const commitMessageWithoutPrefix = firstLineOfCommitMessage?.replace(
    /^(fix|feat|chore):\s*/,
    "",
  );
  return commitMessageWithoutPrefix;
}
```

✅ Prefer concise names

```ts
export function parse(message?: string): string | undefined {
  const trimmed = message?.trim();
  const first = trimmed?.split("\n")[0];
  return first?.replace(/^(fix|feat|chore):\s*/, "");
}
```

## Commits and PRs

- Prefer minimal, atomic changes.
- Use [Conventional Commits](https://www.conventionalcommits.org) for commit
  messages (`fix(git): fix bug in git package`).

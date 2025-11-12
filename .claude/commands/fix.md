---
description: Provide a bugfix
argument-hint: "<description> [@file...]"
allowed-tools:
  - Bash(git append:*)
  - Bash(git commit:*)
  - Bash(flow:*)
---

## Arguments

Description of the bug: #$ARGUMENTS

- `<description>`: explanation of the bug to fix
- `@file...`: confine fix to specified files only

If arguments don't match these patterns, ask the user for clarification.

## Error handling

- **No description provided**:
  - Ask the user to provide a description of the bug to fix.
- **Tests don't exist**:
  - Notify the user that no tests exist for the affected features. Continue
    without adding tests.
- **File does not exist**:
  - Gracefully handle typos in passed file names.
  - Notify user if @file is not found.

## Your task

You are the diligent developer who writes maintainable and robust code.

You will:

- Adhere to the coding guidelines of the project.
- Provide minimal changes to the codebase.
- Keep tests case in a logical order in their file.
- Ensure the fix is tested and does not regress existing behaviour.
- Write clear commit messages that describe the fix.
- Create commits on behalf of yourself ("Claude <noreply@anthropic.com>") and
  disable commit signing.

You will NOT:

- Introduce unnecessary complexity or dependencies.
- Leave around code that doesn't serve a purpose.
- Make stylistic changes unless they improve readability or maintainability.

## Process

1. Start a new branch for the fix: `git town append <branch>` (e.g.
   `fix/git/commit/amend-error-message`)
2. Add a test that reproduces the bug if one does not exist. Run the test, and
   observe failure: `flow test <test-file>`.
3. Provide the fix. Run the test, and observe success.
4. Cleanup added code that no longer serves a purpose.
5. Run checks and tests against all changed files: `flow`
6. Commit the fix with a descriptive
   [Conventional Commit](https://www.conventionalcommits.org) message:
   "`fix(<module>): <description>`".
7. Request a review with the /review command. Address critical review feedback,
   ensuring tests continue to pass.

## Output format

- **Summary**: High-level summary of how the fix works.
- **Assessment**: Provide confidence in the produced fix.

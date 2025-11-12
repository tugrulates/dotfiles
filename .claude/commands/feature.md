---
description: Implement a feature
argument-hint: "<description> [@file...]"
allowed-tools:
  - Bash(git append:*)
  - Bash(git commit:*)
  - Bash(flow:*)
---

## Arguments

Description of the feature: #$ARGUMENTS

- `<description>`: explanation of the feature to implement
- `@file...`: confine implementation to specified files only

If arguments don't match these patterns, ask the user for clarification.

## Error handling

- **No description provided**:
  - Ask the user to provide a description of the feature to implement.
- **File does not exist**:
  - Gracefully handle typos in passed file names.
  - Notify user if @file is not found.

## Your task

You are an experienced developer who writes simple and maintainable code.

You will:

- Adhere to the coding guidelines of the project.
- Keep changes consistent with the surrounding codebase.
- Keep tests case in a logical order in their file.
- Write clear commit messages that describe the feature.
- Create commits on behalf of yourself ("Claude <noreply@anthropic.com>") and
  disable commit signing.

You will NOT:

- Introduce unnecessary complexity or dependencies.
- Leave around code that doesn't serve a purpose.

## Process

1. Start a new branch for the feature: `git town append <branch>` (e.g.
   `feat/git/branch/config`)
2. Implement the feature interface, and a stub implementation.
3. Add tests that cover crucial functionality. Run the tests, and observe
   failure: `flow test <test-file>`.
4. Provide the implementation, run the tests, and observe success.
5. Cleanup added code that no longer serves a purpose.
6. Run checks and tests against all changed files: `flow`
7. Commit the fix with a descriptive
   [Conventional Commit](https://www.conventionalcommits.org) message:
   "`feat(<module>): <description>`". Disable commit signing.
8. Request a review with the /review command. Address critical review feedback,
   ensuring tests continue to pass.

## Output format

- **Summary**: Summary of how the feature is used works.
- **Implementation**: Brief summary of how the implementation works.

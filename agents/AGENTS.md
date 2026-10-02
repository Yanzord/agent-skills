# AGENTS.md

Global behavioral and development guidelines.

These instructions apply to all projects unless a project-specific `AGENTS.md` overrides them.

The default bias is toward simplicity, correctness, minimal changes, and respect for the existing project structure.

## 1. Communication

- Be concise, objective, and direct.
- Avoid unnecessary explanations, repetition, and verbose summaries.
- Communicate with me in Brazilian Portuguese unless I request another language.
- Keep source code, identifiers, technical terminology, commit messages, and documentation in English unless the project already follows another convention.
- Surface assumptions instead of silently making them.
- If a relevant requirement is ambiguous and materially affects the implementation, ask before proceeding.
- If there are meaningful trade-offs, briefly explain them before choosing an approach.

## 2. Think Before Coding

Before implementing a change:

- Understand the requested behavior.
- Inspect the existing project structure and conventions.
- Identify the smallest change that satisfies the requirement.
- Do not invent requirements or features.
- Do not silently choose between materially different interpretations.
- Prefer an existing project pattern over introducing a new one.

If a simpler solution exists, prefer it.

Do not overengineer.

## 3. Simplicity First

Write the minimum amount of code necessary to correctly solve the problem.

- Do not add features that were not requested.
- Do not create abstractions for code that has only one clear use.
- Do not introduce unnecessary layers, wrappers, factories, interfaces, configuration, or indirection.
- Avoid speculative extensibility.
- Avoid premature optimization.
- Prefer readable and explicit code over clever code.
- Prefer language and framework idioms already used by the project.

If an implementation becomes substantially larger or more complex than necessary, reconsider the approach before continuing.

## 4. Architecture

Always inspect and respect the architecture already present in the project.

- Follow existing module, package, directory, dependency, and layering conventions.
- Respect established boundaries between domain, application, infrastructure, presentation, persistence, and other layers when they exist.
- Do not introduce a new architectural pattern into an existing project unless explicitly requested.
- Do not refactor the architecture as a side effect of another task.

If the project does not have a discernible architecture and the requested change requires architectural decisions, ask me which architecture or organizational pattern should be followed before introducing one.

For trivial or isolated changes that do not require architectural decisions, use the simplest structure consistent with the existing codebase.

## 5. Dependencies

Prefer the standard library and dependencies already present in the project.

Do not add a new library or dependency unless:

1. I explicitly request it; or
2. It substantially simplifies the implementation, improves correctness, or avoids implementing non-trivial functionality that a mature library already provides.

In the second case:

- Do not add the dependency silently.
- Tell me which dependency you propose.
- Briefly explain why it is preferable to implementing the functionality directly.
- Mention relevant trade-offs such as maintenance, runtime cost, bundle size, licensing, or ecosystem impact when applicable.
- Wait for approval before adding it unless I explicitly gave you autonomy to make dependency decisions.

Do not add dependencies merely to save a few lines of straightforward code.

## 6. Surgical Changes

Modify only what is necessary for the requested task.

- Do not refactor unrelated code.
- Do not reformat unrelated files.
- Do not rename unrelated symbols.
- Do not update unrelated dependencies.
- Do not rewrite code simply because you prefer another style.
- Match the style and conventions already used in the project.
- If you notice unrelated problems, mention them instead of fixing them without permission.

When your own changes make imports, variables, functions, files, or other code unused, remove those artifacts.

Every changed line should have a clear relationship to the requested task.

## 7. Clean Code

Prioritize readable, maintainable, and idiomatic code.

- Use clear and meaningful names.
- Keep functions and classes focused.
- Avoid unnecessary nesting.
- Avoid duplicated logic when a simple reusable abstraction is clearly justified.
- Prefer explicit behavior over hidden side effects.
- Keep business rules easy to locate and understand.
- Follow the established formatting and linting rules of the project.

Do not optimize for cleverness.

Optimize for clarity.

## 8. Code Comments

Do not add comments to source code by default.

Prefer self-explanatory code, meaningful names, and clear structure.

Only add a code comment when:

- I explicitly request it; or
- the code contains a genuinely non-obvious technical constraint that cannot reasonably be made clear through the implementation itself.

Do not add comments that merely restate what the code does.

Do not add explanatory comments, tutorial comments, section comments, or AI-generated narration to otherwise readable code.

Preserve existing comments unless the requested change makes them incorrect or obsolete.

## 9. Testing

Every implementation must be verified using the testing conventions already established by the project.

Before modifying behavior:

- Inspect the existing test structure.
- Identify the test framework, naming conventions, test organization, and commands used by the project.
- Follow those conventions exactly.

When changing behavior:

- Add or update relevant tests when appropriate.
- For bug fixes, prefer a test that reproduces the bug before fixing it when practical.
- For new behavior, test the meaningful success and failure cases.
- Run the relevant tests after implementation.

Never claim tests passed unless they were actually executed successfully.

If the project has no established testing pattern, test framework, or test dependencies:

- Do not choose one silently.
- Ask me which testing approach and libraries should be used.
- If useful, briefly present the most appropriate options for the current stack.

Do not add a testing library without approval when none is already established.

## 10. Validation

Do not consider a task complete merely because the code was written.

Use the project's available verification mechanisms when relevant, including:

- automated tests;
- compilation;
- static analysis;
- linting;
- formatting checks;
- type checking;
- build commands;
- integration tests.

For multi-step changes, use a short implementation plan with verifiable outcomes when the task benefits from one.

A successful implementation must be demonstrably consistent with the project's existing quality checks.

## 11. Git

Do not create commits unless I explicitly ask you to.

Do not push unless I explicitly ask you to.

Do not:

- rewrite Git history;
- amend commits;
- force push;
- rebase;
- reset branches;
- delete branches;

unless I explicitly request that operation.

When creating commits on my behalf:

- Never add yourself as an author, co-author, contributor, signer, assistant, agent, or collaborator.
- Never add `Co-authored-by` lines referring to an AI system, OpenAI, Codex, ChatGPT, or any other assistant.
- Never mention AI assistance in the commit message unless I explicitly request it.
- Use only my configured Git identity.
- Follow the project's commit convention if one exists.
- Otherwise prefer concise Conventional Commit-style messages when appropriate.

Do not modify Git configuration unless the task explicitly requires it.

## 12. Existing Project Conventions

Before making meaningful changes, inspect relevant existing code.

Prefer consistency with the project over personal preference.

This applies to:

- architecture;
- naming;
- error handling;
- dependency injection;
- logging;
- configuration;
- serialization;
- persistence;
- API design;
- testing;
- formatting;
- build tooling;
- package organization.

If a project-specific pattern is clearly established, follow it even if another approach could also work.

## 13. Error Handling

Handle realistic failure scenarios.

Do not add defensive code for impossible or irrelevant scenarios merely to appear robust.

Use the project's existing error-handling model.

Do not swallow exceptions or errors silently.

Do not introduce a new error abstraction unless it is necessary and consistent with the project.

## 14. Security and Secrets

Never expose or commit:

- passwords;
- API keys;
- access tokens;
- private keys;
- credentials;
- secrets;
- sensitive environment values.

Do not print secrets to logs or command output.

Use the project's established environment or secret-management strategy.

If a requested implementation risks exposing sensitive information, stop and explain the concern.

## 15. Destructive Operations

Do not perform destructive or difficult-to-reverse operations without explicit approval.

Examples include:

- deleting significant data;
- dropping databases or tables;
- destructive migrations;
- deleting infrastructure;
- overwriting important configuration;
- removing large sets of files;
- force operations in Git.

When unsure whether an action is destructive, ask first.

## 16. Definition of Done

Before considering a task complete, verify that:

1. The requested behavior is implemented.
2. The implementation follows the existing architecture and project conventions.
3. No unnecessary dependencies were introduced.
4. No unrelated code was modified.
5. Relevant tests were added or updated when appropriate.
6. Relevant tests and project validation commands were executed successfully.
7. No unnecessary comments were added.
8. No secrets or sensitive information were introduced.
9. The resulting code is as simple as reasonably possible.

If any item could not be verified, clearly state that limitation.

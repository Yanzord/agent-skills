---
name: create-learning-poc
description: Creates a small, incremental learning POC for studying a technical concept through hands-on implementation.
---

# Create Learning POC

Use this skill when the user wants to learn a technical concept by building a small proof of concept.

The goal is not to create a production-ready application.

The goal is to create the smallest useful implementation that exposes the concepts being studied.

## Workflow

When creating a learning POC:

1. Identify the main learning objective.
2. Identify the minimum stack required.
3. Keep the domain intentionally simple.
4. Avoid introducing unrelated architectural complexity.
5. Create a dedicated directory using kebab-case.
6. Generate a `CONTEXT.md` for the POC.
7. Define a small sequence of learning milestones.
8. Set only the first unfinished milestone as `Current Focus`.
9. Do not implement the entire learning path immediately.
10. Prefer explicit implementations before introducing abstractions or automation.

## CONTEXT.md

Every learning POC must contain a `CONTEXT.md`.

It should contain:

- Project
- Stack
- Main Goal
- Scope
- Current Progress
- Completed Milestones
- Concepts to Learn
- Learning Sequence
- Current Focus
- Not Yet In Scope
- Project Principles
- Context Maintenance

The document represents the current state of the learning process.

It must not become a chronological execution log.

## Milestones

Milestones should:

- be small;
- introduce one main concept at a time;
- be independently understandable;
- include validation when applicable;
- build progressively on previous concepts.

Prefer:

Concept A
↓
Concept B
↓
Concept C

Instead of implementing all concepts in a single task.

## Learning Style

Before implementing a new concept:

1. Explain what it is.
2. Explain why it exists.
3. Show where it fits in the current POC.
4. Implement the smallest useful example.
5. Validate the result.
6. Explain what should be observed.
7. Update `CONTEXT.md`.

## Dependencies

Do not introduce dependencies unnecessarily.

When a dependency is useful but not strictly required:

- explain what it does;
- explain why it helps;
- ask before adding it if project instructions require approval.

## Abstractions

During early learning stages:

Prefer:

explicit behavior
↓
understanding
↓
abstraction

Avoid hiding the concept being studied behind frameworks, wrappers, generators, or automatic configuration too early.

## Scope Control

Keep future concepts in `Not Yet In Scope`.

Do not implement future milestones unless explicitly requested.

The POC should evolve incrementally.

## Validation

Each meaningful implementation milestone should be validated using the testing or validation conventions of the project.

If no validation convention exists, follow the parent project's instructions.

## Completion

After creating the POC:

- summarize its objective;
- show the generated milestone sequence;
- state the initial `Current Focus`;
- do not begin implementing later milestones automatically.
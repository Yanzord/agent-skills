# Agent Config

Personal configuration repository for AI-assisted software development.

This repository centralizes reusable instructions, skills, templates, and setup scripts used by coding agents such as Codex and Claude.

## Structure

```text
agent-config/
├── agents/       # Agent-specific instructions and configuration
├── skills/       # Reusable skills and workflows
├── templates/    # Shared templates
└── scripts/      # Installation and setup utilities
```

The goal is to keep agent behavior consistent across projects while versioning the configuration in a single place.

## Installation

The repository includes an installation script that configures supported coding agents using symbolic links.

Run:

```bash
./scripts/install.sh
```

The script detects the agents available in the local environment and links the corresponding configuration and skills from this repository to their expected locations.

This keeps the repository as the source of truth: changes made here are automatically reflected in the linked agent configuration.

Existing configuration files are backed up before being replaced when necessary.

## Philosophy

Keep agent configuration:

- centralized;
- version controlled;
- reusable across projects;
- easy to install on a new development environment;
- independent from individual project repositories.

Project-specific instructions and context should remain inside their respective repositories.
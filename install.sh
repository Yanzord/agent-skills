#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

AGENTS_SOURCE="$REPO_DIR/agents/AGENTS.md"
CLAUDE_SOURCE="$REPO_DIR/agents/CLAUDE.md"
SKILLS_SOURCE="$REPO_DIR/skills"

CODEX_DIR="$HOME/.codex"
CLAUDE_DIR="$HOME/.claude"

BACKUP_DIR="$REPO_DIR/.backup/$(date +%Y%m%d-%H%M%S)"

backup_if_needed() {
    local target="$1"

    if [[ -L "$target" ]]; then
        rm "$target"
        return
    fi

    if [[ -e "$target" ]]; then
        mkdir -p "$BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
        echo "Backed up: $target"
    fi
}

create_link() {
    local source="$1"
    local target="$2"

    backup_if_needed "$target"

    ln -s "$source" "$target"

    echo "Linked: $target -> $source"
}

install_skills() {
    local agent_dir="$1"

    [[ -d "$SKILLS_SOURCE" ]] || return

    mkdir -p "$agent_dir/skills"

    for skill in "$SKILLS_SOURCE"/*; do
        [[ -d "$skill" ]] || continue

        local skill_name
        skill_name="$(basename "$skill")"

        create_link \
            "$skill" \
            "$agent_dir/skills/$skill_name"
    done
}

install_codex() {
    echo "Installing Codex configuration..."

    mkdir -p "$CODEX_DIR"

    create_link \
        "$AGENTS_SOURCE" \
        "$CODEX_DIR/AGENTS.md"

    install_skills "$CODEX_DIR"

    echo
}

install_claude() {
    echo "Installing Claude configuration..."

    mkdir -p "$CLAUDE_DIR"

    create_link \
        "$CLAUDE_SOURCE" \
        "$CLAUDE_DIR/CLAUDE.md"

    install_skills "$CLAUDE_DIR"

    echo
}

echo "Installing agent configuration from:"
echo "$REPO_DIR"
echo

installed_any=false

if command -v codex >/dev/null 2>&1; then
    install_codex
    installed_any=true
else
    echo "Codex not found. Skipping."
fi

if command -v claude >/dev/null 2>&1; then
    install_claude
    installed_any=true
else
    echo "Claude not found. Skipping."
fi

echo

if [[ "$installed_any" == true ]]; then
    echo "Agent configuration installed successfully."
else
    echo "No supported agents were found."
fi

if [[ -d "$BACKUP_DIR" ]]; then
    echo
    echo "Previous configuration backed up to:"
    echo "  $BACKUP_DIR"
fi
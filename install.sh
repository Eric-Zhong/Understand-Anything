#!/usr/bin/env bash
# Understand-Anything installer (macOS / Linux)
#
# Usage:
#   ./install.sh                       Prompt for platform
#   ./install.sh <platform>            Install for <platform>
#   ./install.sh --update              Pull latest changes
#   ./install.sh --uninstall <plat>    Remove links for <plat>
#   ./install.sh --help
#
# When run from a file inside a checkout, that checkout is used as-is (no
# clone, no pull). Curl-pipe installs still clone to $HOME/.understand-anything/repo.
#
# Curl-pipe usage:
#   curl -fsSL https://raw.githubusercontent.com/Egonex-AI/Understand-Anything/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/Egonex-AI/Understand-Anything/main/install.sh | bash -s codex
#
# Environment:
#   UA_REPO_URL  Override clone URL (default: official GitHub repo)
#   UA_DIR       Override checkout dir (default: local checkout, else
#                $HOME/.understand-anything/repo)

set -euo pipefail

# Detect whether this script was launched from a real file (curl | bash has no
# BASH_SOURCE) that sits in a complete checkout. In that case skills can be
# linked straight from the local sources without cloning a second copy.
SCRIPT_DIR=""
if [[ -n "${BASH_SOURCE[0]:-}" && -f "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd -P)" || SCRIPT_DIR=""
fi

LOCAL_REPO=""
if [[ -n "$SCRIPT_DIR" && -d "$SCRIPT_DIR/.git" && -f "$SCRIPT_DIR/install.sh" \
      && -d "$SCRIPT_DIR/understand-anything-plugin/skills" ]]; then
  LOCAL_REPO="$SCRIPT_DIR"
fi

REPO_URL="${UA_REPO_URL:-https://github.com/Egonex-AI/Understand-Anything.git}"
PLUGIN_LINK="$HOME/.understand-anything-plugin"

# UA_DIR wins; otherwise prefer the local checkout, then the standalone cache.
if [[ -n "${UA_DIR:-}" ]]; then
  REPO_DIR="$UA_DIR"
elif [[ -n "$LOCAL_REPO" ]]; then
  REPO_DIR="$LOCAL_REPO"
else
  REPO_DIR="$HOME/.understand-anything/repo"
fi

use_local_checkout() { [[ -n "$LOCAL_REPO" && "$REPO_DIR" == "$LOCAL_REPO" ]]; }

# Platform table — id|skills-target-dir|style
# style "per-skill": one symlink per skill into the target dir
# style "folder":    one symlink for the whole skills/ dir into the target,
#                    named "understand-anything"
platforms_table() {
  cat <<EOF
gemini|$HOME/.agents/skills|per-skill
codex|$HOME/.agents/skills|per-skill
opencode|$HOME/.agents/skills|per-skill
pi|$HOME/.agents/skills|per-skill
openclaw|$HOME/.openclaw/skills|folder
antigravity|$HOME/.gemini/antigravity/skills|folder
vibe|$HOME/.vibe/skills|per-skill
vscode|$HOME/.copilot/skills|per-skill
hermes|$HOME/.hermes/skills|folder
cline|$HOME/.cline/skills|folder
kimi|$HOME/.kimi-code/skills|folder
trae|$HOME/.trae/skills|per-skill
nanobot|$HOME/.nanobot/workspace/skills|per-skill
kiro|$HOME/.kiro/skills|per-skill
dsh|$HOME/.dsh/skills|per-skill
codebuddy|$HOME/.codebuddy/skills|per-skill
EOF
}

platform_ids() { platforms_table | cut -d'|' -f1; }

resolve_platform() {
  local id="$1"
  local row
  row="$(platforms_table | awk -F'|' -v id="$id" '$1==id {print; exit}')"
  if [[ -z "$row" ]]; then
    printf 'Unknown platform: %s\n' "$id" >&2
    printf 'Supported: %s\n' "$(platform_ids | tr '\n' ' ')" >&2
    exit 1
  fi
  printf '%s\n' "$row"
}

prompt_platform() {
  local ids=()
  while IFS= read -r id; do ids+=("$id"); done < <(platform_ids)

  printf 'Which platform are you installing for?\n' >&2
  local i=1
  for id in "${ids[@]}"; do
    printf '  %d) %s\n' "$i" "$id" >&2
    i=$((i+1))
  done
  printf 'Choose [1-%d]: ' "${#ids[@]}" >&2

  local choice=""
  if { exec 3</dev/tty; } 2>/dev/null; then
    read -r choice <&3 || true
    exec 3<&-
  else
    read -r choice || true
  fi
  if [[ -z "$choice" ]]; then
    printf '\nNo input received. Pass the platform as an argument instead, e.g.:\n' >&2
    printf '  install.sh codex\n' >&2
    exit 1
  fi
  if ! [[ "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#ids[@]} )); then
    printf 'Invalid choice: %s\n' "$choice" >&2
    exit 1
  fi
  printf '%s\n' "${ids[$((choice-1))]}"
}

clone_or_update() {
  if use_local_checkout; then
    printf -- '→ Using local checkout at %s (no clone, no pull)\n' "$REPO_DIR"
    return 0
  fi
  if [[ -d "$REPO_DIR/.git" ]]; then
    printf -- '→ Updating existing checkout at %s\n' "$REPO_DIR"
    git -C "$REPO_DIR" pull --ff-only
  else
    printf -- '→ Cloning %s → %s\n' "$REPO_URL" "$REPO_DIR"
    mkdir -p "$(dirname "$REPO_DIR")"
    git clone "$REPO_URL" "$REPO_DIR"
  fi
}

skills_root() { printf '%s\n' "$REPO_DIR/understand-anything-plugin/skills"; }

list_skills() {
  local root
  root="$(skills_root)"
  if [[ ! -d "$root" ]]; then
    printf 'Skills directory not found: %s\n' "$root" >&2
    exit 1
  fi
  local d
  for d in "$root"/*/; do
    [[ -d "$d" ]] || continue
    basename "$d"
  done
}

link_skills() {
  local target="$1" style="$2"
  local root
  root="$(skills_root)"
  mkdir -p "$target"
  case "$style" in
    per-skill)
      local skill
      while IFS= read -r skill; do
        ln -sfn "$root/$skill" "$target/$skill"
        printf '  ✓ %s → %s\n' "$target/$skill" "$root/$skill"
      done < <(list_skills)
      ;;
    folder)
      ln -sfn "$root" "$target/understand-anything"
      printf '  ✓ %s → %s\n' "$target/understand-anything" "$root"
      ;;
    *)
      printf 'Unknown style: %s\n' "$style" >&2
      exit 1
      ;;
  esac
}

unlink_skills() {
  local target="$1" style="$2"
  [[ -d "$target" ]] || return 0
  case "$style" in
    per-skill)
      if [[ -d "$(skills_root)" ]]; then
        local skill
        while IFS= read -r skill; do
          [[ -L "$target/$skill" ]] && rm -f "$target/$skill"
        done < <(list_skills)
      else
        # Checkout is gone — scan the target dir for stale links pointing into
        # our plugin tree so we can still clean up.
        local link resolved
        for link in "$target"/*; do
          [[ -L "$link" ]] || continue
          resolved="$(readlink "$link" 2>/dev/null || true)"
          [[ "$resolved" == *"/understand-anything-plugin/skills/"* ]] || continue
          rm -f "$link"
        done
      fi
      ;;
    folder)
      [[ -L "$target/understand-anything" ]] && rm -f "$target/understand-anything"
      ;;
  esac
}

link_plugin_root() {
  local src="$REPO_DIR/understand-anything-plugin"
  if [[ -L "$PLUGIN_LINK" ]]; then
    local current
    current="$(readlink "$PLUGIN_LINK")"
    if [[ "$current" == "$src" ]]; then
      printf '  • %s already points here, leaving as-is\n' "$PLUGIN_LINK"
    else
      ln -sfn "$src" "$PLUGIN_LINK"
      printf '  ✓ %s → %s (repointed from %s)\n' "$PLUGIN_LINK" "$src" "$current"
    fi
  elif [[ -e "$PLUGIN_LINK" ]]; then
    printf '  • %s already exists (not a symlink), leaving as-is\n' "$PLUGIN_LINK"
  else
    ln -s "$src" "$PLUGIN_LINK"
    printf '  ✓ %s → %s\n' "$PLUGIN_LINK" "$src"
  fi
}

cmd_install() {
  local id="$1"
  local row target style
  row="$(resolve_platform "$id")"
  target="$(printf '%s\n' "$row" | cut -d'|' -f2)"
  style="$(printf '%s\n' "$row" | cut -d'|' -f3)"

  clone_or_update
  printf -- '→ Linking skills for %s (%s → %s)\n' "$id" "$style" "$target"
  link_skills "$target" "$style"
  printf -- '→ Linking universal plugin root\n'
  link_plugin_root

  if [[ "$id" == "kiro" ]]; then
    printf -- '→ Creating Kiro agent configuration\n'
    mkdir -p "$HOME/.kiro/agents"
    local plugin_root="$REPO_DIR/understand-anything-plugin"

    # Build the "resources" list dynamically from the agent definitions in the
    # repo so it never drifts as agents are added or removed. Deterministic
    # order via LC_ALL=C sort; no external deps (no jq) so it runs anywhere.
    local resources="" agent_md
    while IFS= read -r agent_md; do
      [[ -n "$agent_md" ]] || continue
      [[ -n "$resources" ]] && resources+=$',\n'
      resources+="    \"file://$agent_md\""
    done < <(find "$plugin_root/agents" -maxdepth 1 -type f -name '*.md' | LC_ALL=C sort)

    cat > "$HOME/.kiro/agents/understand.json" <<KIROEOF
{
  "name": "understand",
  "description": "Analyze codebase into interactive knowledge graph — Understand Anything",
  "prompt": "file://$plugin_root/skills/understand/SKILL.md",
  "tools": ["read", "write", "shell", "grep", "glob", "code", "subagent"],
  "resources": [
$resources
  ]
}
KIROEOF
    printf '  ✓ %s\n' "$HOME/.kiro/agents/understand.json"
  fi

  printf '\n✓ Installed Understand-Anything for %s\n' "$id"
  printf '  Restart your CLI or IDE to pick up the skills.\n'
  if [[ "$id" == "codex" ]]; then
    printf '\n  Tip: Codex invokes skills with $ instead of / — type $understand, not /understand.\n'
  fi
  if [[ "$id" == "vscode" ]]; then
    printf '\n  Tip: VS Code can also auto-discover the plugin by opening this repo\n'
    printf '       directly (it reads .copilot-plugin/plugin.json), no symlinks needed.\n'
  fi
  if [[ "$id" == "kiro" ]]; then
    printf '\n  Usage: kiro-cli chat --agent understand "Analyze this project"\n'
  fi
}

cmd_uninstall() {
  local id="$1"
  local row target style
  row="$(resolve_platform "$id")"
  target="$(printf '%s\n' "$row" | cut -d'|' -f2)"
  style="$(printf '%s\n' "$row" | cut -d'|' -f3)"

  printf -- '→ Removing skill links for %s\n' "$id"
  unlink_skills "$target" "$style"
  if [[ "$id" == "kiro" && -f "$HOME/.kiro/agents/understand.json" ]]; then
    rm -f "$HOME/.kiro/agents/understand.json"
    printf '  ✓ removed %s\n' "$HOME/.kiro/agents/understand.json"
  fi
  if [[ -L "$PLUGIN_LINK" ]]; then
    rm -f "$PLUGIN_LINK"
    printf '  ✓ removed %s\n' "$PLUGIN_LINK"
  fi
  if use_local_checkout; then
    printf '\nYour local checkout at %s was kept untouched.\n' "$REPO_DIR"
  elif [[ -d "$REPO_DIR" ]]; then
    printf '\nThe checkout at %s was kept (other platforms may still use it).\n' "$REPO_DIR"
    printf 'To remove it: rm -rf "%s"\n' "$REPO_DIR"
  fi
}

cmd_update() {
  if [[ ! -d "$REPO_DIR/.git" ]]; then
    printf 'No installation found at %s. Run install first.\n' "$REPO_DIR" >&2
    exit 1
  fi
  git -C "$REPO_DIR" pull --ff-only
  printf '✓ Updated.\n'
}

usage() {
  cat <<USAGE
Understand-Anything installer

Usage:
  install.sh [<platform>]            Install for <platform> (or prompt if omitted)
  install.sh --update                Pull latest changes (skills update through symlinks)
  install.sh --uninstall <platform>  Remove links for <platform>
  install.sh --help

Run from inside a checkout to use it directly: no clone, no pull, no network,
and local edits take effect immediately. Use --update to pull it explicitly.
Otherwise the repo is cloned to \$HOME/.understand-anything/repo.

Checkout in use: $REPO_DIR

Supported platforms:
$(platform_ids | sed 's/^/  - /')

Environment:
  UA_REPO_URL  Override clone URL (default: official repo)
  UA_DIR       Override checkout dir (default: local checkout, else
               \$HOME/.understand-anything/repo)
USAGE
}

main() {
  case "${1:-}" in
    -h|--help)
      usage
      ;;
    --update)
      cmd_update
      ;;
    --uninstall)
      shift
      if [[ -z "${1:-}" ]]; then
        printf '%s\n' '--uninstall requires a platform argument' >&2
        usage >&2
        exit 1
      fi
      cmd_uninstall "$1"
      ;;
    "")
      local id
      id="$(prompt_platform)"
      cmd_install "$id"
      ;;
    -*)
      printf 'Unknown option: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
    *)
      cmd_install "$1"
      ;;
  esac
}

main "$@"

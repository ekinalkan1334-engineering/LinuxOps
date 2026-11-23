
# Command Reference — `<Topic>`

> **How to use this template:**
>
> Create one command reference file per topic (for example, `linux-basics`, `networking`, or `systemd`).
>
> Add one entry per command using the structure below.
>
> - Document commands you have actually run and understood.
> - Explain what each command does in your own words.
> - Include realistic examples based on your environment.
> - Do not present untested commands as successfully tested.
> - Replace all placeholders before publishing the completed document.

| Field | Value |
|---|---|
| Topic | `<topic>` |
| Last Updated | `<YYYY-MM-DD>` |
| Tested On | `<OS and version>` |

---

## Entry Template

### `<command>`

> Short title describing what the command does.

**Purpose:**

`<One sentence explaining what problem the command solves.>`

**Syntax:**

```bash
<command> [options] [arguments]
```

**Common Options:**

| Option | Meaning |
|---|---|
| `<flag>` | `<Explanation of the option>` |

**Example:**

```bash
<example command>
```

**Expected Output:**

```text
<Representative successful output>
```

> Note: Actual output may vary depending on the operating system, user permissions, system configuration, and available resources.

**Test Status:**

`<Tested / Not tested>`

**Needs Elevated Privileges:**

`<Yes / No — explain when and why sudo is required.>`

**Risks and Notes:**

`<Describe destructive effects, common mistakes, limitations, and safer alternatives.>`

**Related Commands:**

`<command>`, `<command>`

---

## Commands

> Add command entries below, ordered by topic or alphabetically. Use the same structure for every entry.

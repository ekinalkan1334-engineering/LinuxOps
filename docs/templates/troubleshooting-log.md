
# Troubleshooting Log — `<Scope or Sprint>`

> **How to use this template:**
>
> Keep one running log per sprint or component.
>
> For example: `docs/sprints/sprint-02-troubleshooting-log.md`.
>
> Add a new entry whenever something does not work as expected.
>
> - Use this log for everyday technical problems and debugging.
> - Use an incident report for significant service-level failures.
> - Record what you actually observed and the checks you performed.
> - Do not guess the root cause. If it is unknown, state that it is still under investigation.
> - Record the exact fix and how you verified the result.
> - Remove credentials and other sensitive information from logs.

| Field | Value |
|---|---|
| Scope | `<Sprint or component>` |
| Last Updated | `<YYYY-MM-DD>` |

---

## Log Index

> Add one row for every troubleshooting entry.
>
> Keep IDs unique and update the status when an issue changes.

| ID | Date | Component | Symptom | Priority | Status |
|---|---|---|---|---|---|
| TS-001 | `<YYYY-MM-DD>` | `<Component>` | `<Short symptom>` | `<Low / Medium / High>` | `<Open / Investigating / Resolved>` |

---

## Entry Template

### TS-`<NNN>` — `<Short Title>`

| Field | Value |
|---|---|
| Date | `<YYYY-MM-DD>` |
| Component | `<Service, file, operating system, or tool>` |
| Priority | `<Low / Medium / High>` |
| Status | `<Open / Investigating / Resolved>` |
| Related Sprint | `<Sprint number>` |

**Symptom:**

`<Describe what happened. Include the exact error message or unexpected behavior when available.>`

**Expected Behavior:**

`<Describe what should have happened.>`

**Impact:**

`<Explain what was affected and whether work could continue.>`

**Checks Performed:**

> Record the commands or actions you actually performed and their results.

| # | Command / Action | Result |
|---|---|---|
| 1 | `<Command or action>` | `<Observed result>` |

**Finding / Root Cause:**

`<Explain what the investigation revealed. If the cause is not confirmed, state "Unknown — investigation ongoing.">`

**Fix Applied:**

`<Describe the exact change or action taken. Include the file path or command when relevant. If no fix has been applied, state "Not yet resolved.">`

**Verification:**

`<Explain how you checked whether the fix worked. Include the command, test, or observed result.>`

**Result:**

`<Describe the final outcome. State whether the issue is resolved, partially resolved, or still open.>`

**Takeaway:**

`<Explain what you learned and what you would check first if the problem happened again.>`

**Related Evidence:**

`<Screenshot, log file, or evidence path. Use "None" if not applicable.>`

**Related Documentation:**

`<Link to the relevant sprint report, command reference, or incident report. Use "None" if not applicable.>`

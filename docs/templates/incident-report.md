
# Incident Report INC-`<NNN>` — `<Short Title>`

> **How to use this template:**
>
> Copy this template when documenting an incident.
>
> Planned location: `docs/incidents/inc-<nnn>-<short-title>.md`
>
> The `docs/incidents/` directory will be created when incident documentation is introduced in a later sprint.
>
> - Write in a blameless and factual manner. Describe what happened and how the system behaved, not who is at fault.
> - Clearly identify whether the incident was simulated or real.
> - Use actual observations, commands, logs, and measurements.
> - Do not invent timestamps, impact measurements, or verification results.
> - Replace all placeholders before publishing the completed report.

| Field | Value |
|---|---|
| Incident ID | INC-`<NNN>` |
| Type | `<Simulated / Real>` |
| Category | `<Stopped service / Port conflict / Proxy or firewall misconfiguration / Other>` |
| Severity | `<Low / Medium / High — with justification>` |
| Status | `<Open / Resolved>` |
| Date | `<YYYY-MM-DD>` |
| Author | `<Name or project role>` |

### Severity Guidelines

| Severity | Description |
|---|---|
| Low | Limited impact; the main service remains available or recovery is straightforward |
| Medium | A significant function is unavailable or degraded, but the impact is limited |
| High | A critical service is unavailable or the incident causes substantial system impact |

---

## 1. Summary

> Describe the incident in 2–3 sentences:
>
> - What failed?
> - What was the observed effect?
> - How was the issue resolved?

`<Incident summary>`

---

## 2. Impact

> Describe which service, component, or user-facing behavior was affected.
>
> Include the duration and measured impact when available. If the impact was simulated, state that no real users or production services were affected.

`<Impact description>`

---

## 3. Timeline

> Record events in chronological order. Use actual timestamps from logs or contemporaneous notes.
>
> Include the time zone when relevant.

| Time | Event |
|---|---|
| `<HH:MM>` | `<Observed event>` |
| `<HH:MM>` | `<Investigation or action>` |
| `<HH:MM>` | `<Resolution or verification>` |

---

## 4. Detection

> Explain how the issue was detected.
>
> Examples:
>
> - Monitoring alert
> - Failed HTTP request
> - Service status check
> - Error message in system logs

Detection command:

```bash
<detection command>
```

Observed output:

```text
<actual detection output>
```

---

## 5. Investigation

> Document the investigation step by step.
>
> Include:
>
> - The hypothesis being tested.
> - The command or action performed.
> - The actual result.
> - What the result revealed.
>
> Include unsuccessful attempts when they help explain the troubleshooting process.

| Step | Hypothesis / Action | Command | Finding |
|---|---|---|---|
| 1 | `<What was investigated>` | `<command>` | `<Actual finding>` |
| 2 | `<Next investigation>` | `<command>` | `<Actual finding>` |

---

## 6. Root Cause

> Explain the underlying reason for the incident, not just the visible symptom.
>
> Use evidence from the investigation to support the conclusion.

`<Root cause and supporting evidence>`

---

## 7. Resolution

> List the exact actions taken to restore normal operation.
>
> Keep the actions in chronological order.

1. `<First action>`
2. `<Second action>`
3. `<Final action>`

---

## 8. Verification

> Demonstrate that the resolution worked.
>
> Include the commands used and their actual outputs. A successful command alone is not sufficient if it does not verify the affected behavior.

Verification command:

```bash
<verification command>
```

Observed output:

```text
<actual verification output>
```

**Verification Result:** `<Successful / Unsuccessful / Partially successful>`

---

## 9. Prevention and Follow-up

> Record actions that could prevent recurrence or improve detection.
>
> Distinguish completed work from proposed improvements.

| Action | Owner | Status |
|---|---|---|
| `<Preventive action>` | `<Owner>` | `<Done / Proposed>` |
| `<Monitoring improvement>` | `<Owner>` | `<Done / Proposed>` |

---

## 10. Lessons Learned

> Explain what the incident revealed about:
>
> - The system and its behavior.
> - The troubleshooting process.
> - Monitoring, configuration, or operational practices.
> - Possible improvements for future deployments.

`<Lessons learned>`

---

## 11. Evidence

> Link supporting evidence such as screenshots, logs, configuration excerpts, or test results.
>
> Store evidence in the appropriate sprint evidence directory.

| Evidence | File | Description |
|---|---|---|
| `<Evidence name>` | `evidence/sprint-04/<file>` | `<What the evidence demonstrates>` |

---

## 12. Security and Privacy Notes

- Never include passwords, private keys, access tokens, or other credentials.
- Avoid publishing personal information or sensitive internal network details.
- Sanitize logs and screenshots before adding them to a public repository.
- Include only the evidence necessary to explain and verify the incident.

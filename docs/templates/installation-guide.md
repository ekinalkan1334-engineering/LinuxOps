
# Installation Guide — `<Component or System>`

> **How to use this template:**
>
> Write this guide so that another person can reproduce the installation from a clean environment without needing additional explanations.
>
> - Test every step before marking the guide as verified.
> - Use the exact software versions and configuration values used during testing.
> - Include both terminal commands and graphical interface actions when necessary.
> - Explain why each important step is required.
> - Replace all placeholders before publishing.
> - Never include real passwords, private keys, access tokens, or other secrets.

| Field | Value |
|---|---|
| Component | `<Name and version>` |
| Target Environment | `<OS, version, VM or hardware>` |
| Guide Status | `<Draft / Verified on YYYY-MM-DD>` |
| Author | `<Name or project role>` |
| Last Updated | `<YYYY-MM-DD>` |

---

## 1. Purpose

> Explain:
>
> - What component or system will be installed.
> - Why it is needed.
> - What the system should look like after successful installation.

`<Installation purpose and expected final state>`

---

## 2. Prerequisites

> List everything required before starting the installation.
>
> Include software, hardware resources, network access, installation media, permissions, and accounts where applicable.

| Requirement | Details | Verification |
|---|---|---|
| Operating System | `<OS and version>` | `<Verification command>` |
| Required Software | `<Name and version>` | `<Verification command>` |
| Hardware Resources | `<CPU, RAM, disk>` | `<How to check>` |
| Network Access | `<Required connection>` | `<How to check>` |
| Permissions | `<Required privileges>` | `<How to verify>` |

### Installation Sources

| Resource | Official Source |
|---|---|
| `<Software or installation image>` | `<Official download URL>` |
| `<Documentation>` | `<Official documentation URL>` |

---

## 3. Installation Steps

> Document each step in chronological order.
>
> For every step:
>
> 1. Explain the action.
> 2. Explain why it is needed.
> 3. Provide the command or interface instructions.
> 4. Describe the expected result.
> 5. Record any relevant issues encountered.

### Step 1 — `<Action>`

**Why:**

`<Explain why this step is necessary.>`

**Command or Action:**

```bash id="4c7xws"
<command>
```

**Expected Result:**

`<Describe the expected output or interface state.>`

**Observed Result:**

`<Record the actual result after testing, or mark as Not Tested.>`

---

### Step 2 — `<Action>`

**Why:**

`<Explain why this step is necessary.>`

**Command or Action:**

```bash id="k8v1nh"
<command>
```

**Expected Result:**

`<Describe the expected output or interface state.>`

**Observed Result:**

`<Record the actual result after testing, or mark as Not Tested.>`

---

## 4. Post-Installation Configuration

> Document the settings applied after installation.
>
> Include configuration file paths and commands where relevant.
>
> Never publish real credentials or sensitive values. Use placeholders instead.

| Setting | Value | File / Command | Purpose |
|---|---|---|---|
| `<Setting>` | `<Value>` | `<Path or command>` | `<Why it is configured>` |

### Configuration Notes

`<Additional configuration details, dependencies, or important limitations>`

---

## 5. Verification

> Provide commands and checks that demonstrate the installation is working.
>
> Include actual test results where available. Clearly distinguish expected output from observed output.

**Verification Command:**

```bash id="r9d2vk"
<verification command>
```

**Expected Output:**

```text id="q3f4jt"
<representative successful output>
```

**Observed Result:**

`<Actual result and verification date, or Not Tested>`

**Verification Status:** `<Passed / Failed / Partially Verified / Not Tested>`

---

## 6. Common Errors and Troubleshooting

| Symptom | Likely Cause | Fix |
|---|---|---|
| `<Observed symptom>` | `<Possible cause>` | `<Recommended solution>` |

> Include only errors that were actually encountered or clearly label them as possible troubleshooting cases.

---

## 7. Rollback / Cleanup

> Explain how to safely undo the installation or return the environment to its previous state.
>
> Include:
>
> - Services or processes that must be stopped.
> - Packages or configuration files that may need removal.
> - Virtual machine or disk cleanup steps, if applicable.
> - Backup requirements before destructive operations.
>
> Clearly identify commands that can delete data or permanently change the system.

**Rollback Steps:**

1. `<First action>`
2. `<Second action>`
3. `<Verification of cleanup>`

**Data Loss Warning:**

`<Describe any potential data loss and required backups.>`

---

## 8. References

> Prefer official documentation and download sources.
>
> Record the documentation version or access date where applicable.

| Resource | Version / Description | URL |
|---|---|---|
| `<Official documentation>` | `<Version>` | `<URL>` |
| `<Official download source>` | `<Version>` | `<URL>` |

---

## 9. Evidence

> Link screenshots, command outputs, or other evidence that demonstrates the installation process and final state.

| Evidence | File | Description |
|---|---|---|
| `<Evidence name>` | `evidence/<sprint>/<file>` | `<What it demonstrates>` |

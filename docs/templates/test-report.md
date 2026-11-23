
# Test Report — `<Feature or Sprint>`

> **How to use this template:**
>
> Copy this file to `docs/sprints/` or the relevant project folder.
>
> Record only tests that were actually executed. Define expected results before testing and record actual results afterward.
>
> - Record failed tests as well as successful ones.
> - Use `Not Run` for tests that have not been executed.
> - Use `Blocked` when a test could not be executed because of a dependency or environment issue.
> - Do not invent outputs or test results.
> - A passing local test does not prove production readiness.
> - Remove passwords, tokens, and other sensitive information from logs and screenshots.

| Field | Value |
|---|---|
| Subject | `<What is being tested>` |
| Date | `<YYYY-MM-DD>` |
| Tester | `<Name or project role>` |
| Version / Commit | `<Git commit hash, tag, or "Not committed">` |
| Environment | `<OS, VM settings, network mode, service versions>` |
| Report Status | `<Draft / Final>` |

---

## 1. Scope

> Describe what the tests are intended to verify.
>
> Clearly identify what is included and excluded.

- **In Scope:** `<Features, commands, services, or behaviors being tested>`
- **Out of Scope:** `<Features, scenarios, or environments not covered>`

---

## 2. Test Environment

> Describe the system state before testing.
>
> Include relevant details such as:
>
> - Operating system and version.
> - Virtual machine settings and network mode, if applicable.
> - Services and processes required for testing.
> - Relevant open ports.
> - Configuration and software versions.
> - Required permissions and dependencies.

**Environment Details:**

`<Description of the test environment>`

**Preconditions:**

- `<Required service or dependency>`
- `<Required configuration or permission>`

**Test Data:**

`<Input values or test data used. Do not include real credentials or sensitive information.>`

---

## 3. Test Cases

> Define the expected result before executing each test.
>
> Use one row per test case and assign a unique ID.
>
> Use consistent status values:
>
> - `Pass` — Actual result matches the expected result.
> - `Fail` — Actual result does not match the expected result.
> - `Not Run` — Test has not been executed.
> - `Blocked` — Test could not be executed because of an external dependency or environment issue.

| ID | Description | Command / Steps | Expected Result | Actual Result | Status |
|---|---|---|---|---|---|
| T-001 | `<What is checked>` | `<Command or steps>` | `<Expected behavior>` | `<Observed behavior or "Not run">` | `<Pass / Fail / Not Run / Blocked>` |

---

## 4. Detailed Results

> Provide additional details for failed, blocked, or otherwise notable tests.
>
> Include the command or steps, relevant output, and your analysis.
>
> Avoid duplicating every successful output when the test table already provides sufficient information.

### T-`<NNN>` — `<Test Title>`

**Command / Steps:**

```bash
<Command or test steps>
```

**Expected Result:**

`<Expected behavior>`

**Actual Output:**

```text
<Actual output with sensitive information removed>
```

**Analysis:**

`<Explain why the test passed, failed, or was blocked.>`

**Related Troubleshooting Entry:** `<Link or "None">`

---

## 5. Summary

> Count every test case exactly once.
>
> The total must equal the sum of Passed, Failed, Not Run, and Blocked tests.

| Total | Passed | Failed | Not Run | Blocked |
|---|---|---|---|---|
| `<N>` | `<N>` | `<N>` | `<N>` | `<N>` |

**Overall Result:** `<Passed / Failed / Partially Passed / Not Executed>`

**Summary Notes:**

`<Brief explanation of the overall test outcome.>`

---

## 6. Defects and Follow-up

> Record defects, unexpected behavior, and required follow-up actions.
>
> Do not hide known problems just because other tests passed.
>
> Use the troubleshooting log for detailed investigations.

| ID | Related Test | Issue | Severity | Action / Status |
|---|---|---|---|---|
| D-001 | `<T-001>` | `<Description>` | `<Low / Medium / High>` | `<Fix, pending action, or troubleshooting link>` |

**Severity Guidelines:**

- **Low:** Minor issue with limited impact.
- **Medium:** Noticeable issue affecting functionality or usability.
- **High:** Major failure, security concern, or loss of important functionality.

---

## 7. Limitations

> Explain what these tests do not prove.
>
> Consider whether the tests cover:
>
> - Only one local virtual machine.
> - Only a limited set of input values.
> - No concurrent users or load testing.
> - No external security or penetration testing.
> - No recovery from every possible failure.
> - No production deployment or real-world traffic.
>
> Mention only limitations relevant to the tests performed.

**Known Limitations:**

- `<Limitation 1>`
- `<Limitation 2>`

**Production Readiness:**

`<State clearly that local test results alone do not establish production readiness.>`

---

## 8. Evidence

> Store test evidence under the relevant `evidence/` directory.
>
> Use descriptive filenames and link each item to the test IDs it supports.
>
> Include only screenshots, logs, or other evidence that actually exists.

| Evidence | File | Related Tests | What It Demonstrates |
|---|---|---|---|
| `<Evidence name>` | `evidence/sprint-0<N>/<file>` | `<T-IDs>` | `<Verified result>` |

---

## 9. Conclusion

**Final Assessment:**

`<Briefly explain whether the tested functionality behaved as expected.>`

**Next Steps:**

- `<Remaining test or corrective action>`
- `<Additional validation needed>`

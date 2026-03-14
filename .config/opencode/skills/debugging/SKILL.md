---
name: debugging
description: Systematic debugging workflow for JavaScript, TypeScript, and React
compatibility: opencode
metadata:
  audience: ai agents
  languages: "javascript, typescript"
  frameworks: "react, vite, next.js"
  triggers: "TypeError, ReferenceError, SyntaxError, TS2322, TS2531, Maximum update depth exceeded, useEffect deps, cannot update during render"
---

## Role

You are a debugging expert. Apply scientific method: hypothesize, test, iterate.

## Quick Reference

| Step         | Action                                                         |
| ------------ | -------------------------------------------------------------- |
| 1. DETECT    | Identify error type → route to JavaScript / TypeScript / React |
| 2. GATHER    | Collect error, stack trace, environment                        |
| 3. REPRODUCE | Document bug with input/expected/actual                        |
| 4. ISOLATE   | Narrow down with binary search or print debugging              |
| 5. ANALYZE   | Form hypothesis, gather evidence                               |
| 6. FIX       | Apply minimal fix only                                         |
| 7. VERIFY    | Run command first, then manual repro                           |

**Key Rules:**

- MUST cite evidence (file:line) before fixing
- MUST quote code before analyzing
- MUST verify with command before claiming success
- MAX 5 hypotheses before halting

**Commands:**

- `pnpm test` - Run tests
- `pnpm exec tsc --noEmit` - Type check
- `bash: pwd` - Verify directory

## Detection

AI AGENT: You MUST identify the error type before proceeding. Follow these steps:

**Step 1: Check error message**

| If error contains                                                       | Route to                  |
| ----------------------------------------------------------------------- | ------------------------- |
| `TS` + number (e.g., TS2322, TS2531)                                    | [TypeScript](#typescript) |
| `Maximum update depth exceeded`                                         | [React](#react)           |
| `useEffect` + `deps` or `missing dependency`                            | [React](#react)           |
| `cannot update during render`                                           | [React](#react)           |
| `null children` or `not valid as a child`                               | [React](#react)           |
| `TypeError`, `ReferenceError`, `Promise`, `undefined is not a function` | [JavaScript](#javascript) |

**Step 2: Check file context**

| If codebase is                                               | Route to                  |
| ------------------------------------------------------------ | ------------------------- |
| `.tsx`/`.jsx` with React patterns (useState, useEffect, JSX) | [React](#react)           |
| `.ts` with type annotations                                  | [TypeScript](#typescript) |
| `.js` files                                                  | [JavaScript](#javascript) |

**Step 3: Proceed to the identified section**

**AI AGENT: Follow this workflow:**

1. Read **SHARED BASE** section first (applies to all debugging)
2. Proceed to your language-specific section (JavaScript, TypeScript, or React)
3. Execute steps in order: GATHER → REPRODUCE → ISOLATE → ANALYZE → FIX → VERIFY

---

# SHARED BASE

This section applies to ALL debugging tasks. Read before proceeding to language-specific sections.

## Constraints

AI AGENT: You MUST follow these rules:

- You MUST NOT modify code until issue is understood
- You MUST make ONE change at a time
- You MUST reproduce before fixing
- You MUST verify with command after changes
- You MUST NEVER assume the bug is where the error appears

**"Issue understood" means:**

- You can state the root cause in 1 sentence
- You can cite specific file:line as evidence
- You can explain WHY the bug occurs

If you cannot do all three, return to GATHER or REPRODUCE.

**Guardrails:**

- Verify working directory before grep/glob (run: `bash: pwd` or `git rev-parse`)
- Read file before reasoning about it (don't assume stale context)
- After any edit, grep for usages to check callers
- Run verification command after changes
- Keep fixes minimal; never refactor while debugging

## Minimal Fix Rule

- Fix ONLY the root cause
- DO NOT refactor unrelated code during debugging
- DO NOT change architecture or component structure while debugging
- Keep the smallest possible code change that resolves the issue

## Output Format

After completing each step, output a structured entry:

```
DEBUG LOG:
Observation: <what you observed>
Hypothesis: <why it might be happening>
Test: <what you ran>
Result: <what happened>
Conclusion: <what this tells you>
```

**Rules:**

- Append new entries; do not rewrite previous entries
- Each test must map to exactly one hypothesis
- You MUST cite evidence (file:line or error message) in Observation

## Workflow

AI AGENT: You MUST execute these steps in order for EVERY debugging task:

1. **[GATHER]** - Collect error, environment, history
2. **[REPRODUCE]** - Create minimal reproduction case
3. **[ISOLATE]** - Narrow down with binary search
4. **[ANALYZE]** - Apply think prompts systematically
5. **[FIX]** - Address root cause
6. **[VERIFY]** - Run verification command

**DO NOT skip steps. DO NOT proceed to FIX without evidence.**

## Think Prompts

Execute BEFORE moving to [ISOLATE]:

### Shared Prompts (ALL languages)

- **[THINK 1/6]** What changed recently? → `bash: git diff HEAD~5`
- **[THINK 2/6]** Does it fail on specific interaction or input? → Test user flows / edge cases
- **[THINK 3/6]** Is error at cause or symptom? → Check component hierarchy / call stack

### Language-Specific Prompts

**JavaScript:**

- **[THINK 4/6]** Is it environment-specific? → Check package.json, .env, Node version
- **[THINK 5/6]** What are preconditions? → Check state before error
- **[THINK 6/6]** Is this reproducible? → If no, likely timing issue

**TypeScript:**

- **[THINK 4/6]** Is tsconfig strict mode enabled? → Check tsconfig.json
- **[THINK 5/6]** What are the type constraints? → Check generics
- **[THINK 6/6]** Is this a library type issue? → Check @types packages

**React:**

- **[THINK 4/6]** Is error at cause or symptom? → Check component hierarchy
- **[THINK 5/6]** What triggers the re-render? → Check state/props changes
- **[THINK 6/6]** Is this a state mutation issue? → Check object references

## Output Template

After fixing, output:

```
ROOT CAUSE: <1 sentence - what actually caused bug>

FIX:
<code change>

VERIFICATION:
<test result>

PREVENTION: <how to prevent>
```

## Stop Conditions

Move to [FIX] when ALL are true:

- You can reproduce the issue
- You identified the root cause
- Fix addresses the root cause

Request missing inputs if ANY are true:

- Cannot reproduce
- Environment details missing
- Only speculative changes remain

## Hypothesis Limit

AI AGENT: Limit debugging iterations to avoid infinite loops.

If **5 hypotheses fail**, you MUST stop and report:

```
DEBUGGING HALT:

Observations:
- <fact 1>
- <fact 2>

Hypotheses tested:
1. <hypothesis 1> → failed because <reason>
2. <hypothesis 2> → failed because <reason>
3. <hypothesis 3> → failed because <reason>
4. <hypothesis 4> → failed because <reason>
5. <hypothesis 5> → failed because <reason>

Most likely cause: <your best guess>

Additional information required:
- <what you need>
```

## Hallucination Prevention

AI AGENT: You MUST avoid these common mistakes:

- Assuming error line = bug location
- Making changes without evidence
- Skipping GATHER or REPRODUCE steps
- Not running commands to verify assumptions
- Stating root cause without citing specific file/line

**Before stating ROOT CAUSE, you MUST:**

1. Cite specific file path and line number from evidence
2. Show error message or code snippet as evidence
3. Run verification command to confirm hypothesis
4. If you cannot reproduce, ask for more information

**If ANY of these are true, do NOT proceed to FIX:**

- You cannot reproduce the error
- You don't have specific file/line evidence
- Your hypothesis is based on guessing
- You haven't run any verification command

## Evidence Definition

Evidence MUST be one of the following:

- File path and line number (e.g., `src/components/Form.tsx:42`)
- Stack trace location
- Error message output
- Test failure output
- Command output (e.g., `pnpm exec tsc --noEmit`)

Statements without one of these **are considered speculation** and MUST NOT be used to justify a fix.

## Code Evidence Rule

When analyzing a bug, you MUST include the **relevant code snippet** before explaining the issue.

Example:

```
Evidence:

src/components/UserForm.tsx:32

const handleSubmit = () => {
  setUser(user.name.toUpperCase());
}
```

Explanation must reference the code shown above.

Do NOT analyze code that has not been explicitly quoted or inspected.

## Never Assume

This applies to ALL debugging:

- Error line = bug location → Check component hierarchy / call stack
- First error = root cause → Check chained errors
- It works locally = correct → Check environment differences
- Test passes = edge cases covered → Verify coverage
- useEffect runs once = [] is correct → Check if deps needed (React)
- Component re-renders = state changed → Check props stability (React)
- TypeScript compiles = types are correct → Check strict mode (TypeScript)
- Library types are correct → Check @types version (TypeScript)

---

# JavaScript

For runtime errors: TypeError, ReferenceError, SyntaxError, Promise issues

## Step 1: GATHER

**REQUIRED:**

- Full error message and stack trace
- Node.js version or browser
- Runtime context (browser, Node, Deno, Bun)

**TOOLS:**

- grep to find error strings
- `bash: node -v` for Node version
- `bash: pnpm list` for dependencies

## Step 2: REPRODUCE

**GOOD OUTPUT:**

```
processUser(null) → TypeError at line 45
Expected: {}
Actual: exception
```

Describe the bug with:

- Input that triggers the error
- Expected behavior
- Actual behavior

## Step 3: ISOLATE

**Print debugging** (temporary; only AFTER repro):

```javascript
function func(data) {
  console.log("[DBG1] input:", typeof data, data);
  const x = step1(data);
  console.log("[DBG1] afterStep1:", typeof x, x);
  return step2(x);
}
```

**Divide & conquer:**

- Disable half of code path using early returns
- Run same repro
- If error persists - bug in enabled half

## Step 4: ANALYZE

**Error Categories:**

| Category                    | Common Triggers                      |
| --------------------------- | ------------------------------------ |
| null ref                    | accessing property on undefined/null |
| undefined is not a function | calling non-function, wrong type     |
| Promise pending             | missing await                        |
| race condition              | async timing, shared state           |
| type mismatch               | wrong type passed                    |
| event loop blocking         | synchronous heavy computation        |

## Step 5: FIX

```javascript
// BEFORE (bug):
function getUser(uid) {
  return users[uid]; // undefined if missing
}

// AFTER (fix):
function getUser(uid) {
  return users[uid] ?? null;
}
```

**Checklist:**

- [ ] Addresses root cause
- [ ] Doesn't break existing functionality

## Step 6: VERIFY

Run existing tests to verify fix:

- `bash: pnpm test` - Run all tests
- `bash: node test.js` - Run specific test file

**After applying a fix, you MUST:**

1. **First:** Run the verification command (tests or type check)
2. **Second:** Re-run the **original reproduction steps** (manually or via script)
3. **Third:** Confirm the bug no longer occurs

**Order matters:** Verify with command FIRST, then manually confirm.

If the issue still reproduces, return to **ISOLATE** and continue debugging.

## Reference

### Null/Undefined Safe Access

| Value     | Safe Access                      |
| --------- | -------------------------------- |
| undefined | `obj?.prop` (optional chaining)  |
| null      | `obj?.prop` or `obj && obj.prop` |

### Common Errors

| Error                                          | Cause                     |
| ---------------------------------------------- | ------------------------- |
| TypeError: Cannot read properties of undefined | Missing optional chaining |
| TypeError: undefined is not a function         | Called non-function       |
| ReferenceError: x is not defined               | Variable not in scope     |
| Promise pending                                | Missing await             |
| RangeError: Maximum call stack size exceeded   | Infinite recursion        |

### Debug Tools

| Tool                | Use For                   |
| ------------------- | ------------------------- |
| Neovim              | Edit files, inline errors |
| Chrome DevTools     | Browser debugging         |
| pnpm exec tsc       | Type check (if using TS)  |
| context7_query-docs | JS documentation          |
| codesearch          | Pattern examples          |

---

# TypeScript

For compile-time type errors: TS2322, TS2531, type assignability issues

## Step 1: GATHER

**REQUIRED:**

- Full TypeScript error message with line/column
- tsconfig.json settings (especially strict mode)
- TypeScript version

**TOOLS:**

- `bash: pnpm exec tsc --version` for TS version
- `bash: pnpm exec tsc --noEmit` to get all errors
- grep to find type definitions

## Step 2: REPRODUCE

**GOOD OUTPUT:**

```
error TS2322: Type 'string | undefined' is not assignable to type 'string'
at line 45: user.name = value;
Expected: user.name is string
Actual: user.name can be undefined
```

Describe the type error with:

- Full error code and message
- File and line number
- Expected vs actual type

## Step 3: ISOLATE

**Type narrowing techniques:**

```typescript
// Add type annotations to trace
function debugType(x: unknown): void {
  console.log("[DBG1] type:", typeof x);
  console.log("[DBG1] value:", x);
}
```

**Binary search:**

- Comment out half of code
- Run `bash: pnpm exec tsc --noEmit`
- If error persists - bug in remaining half

## Step 4: ANALYZE

**Error Categories:**

| Category          | Common Triggers                       |
| ----------------- | ------------------------------------- |
| assignability     | Type A not assignable to Type B       |
| property missing  | Property doesn't exist on type        |
| cannot find name  | Variable not in scope or not imported |
| generic arguments | Wrong number or type of generics      |
| union types       | Narrowing needed                      |
| strict null       | Property might be undefined/null      |
| index signature   | Object has no index signature         |

## Step 5: FIX

```typescript
// BEFORE (error):
function greet(user: User) {
  return user.name.toUpperCase(); // TS2531: Object possibly null
}

// AFTER (fix):
function greet(user: User) {
  return user.name?.toUpperCase() ?? "Anonymous";
}
```

Or with strict null checks:

```typescript
// If name should always exist:
function greet(user: User & { name: string }) {
  return user.name.toUpperCase();
}
```

**Checklist:**

- [ ] tsc passes without errors
- [ ] Doesn't break runtime behavior
- [ ] Handles all type cases

## Step 6: VERIFY

Verify type errors are resolved:

- `bash: pnpm exec tsc --noEmit` - Type check passes
- `bash: pnpm test` - Run tests (if runtime behavior matters)

**After applying a fix, you MUST:**

1. **First:** Run the verification command (tests or type check)
2. **Second:** Re-run the **original reproduction steps** (manually or via script)
3. **Third:** Confirm the bug no longer occurs

**Order matters:** Verify with command FIRST, then manually confirm.

If the issue still reproduces, return to **ISOLATE** and continue debugging.

## Reference

### Common Errors

| Error                                                       | Cause                          |
| ----------------------------------------------------------- | ------------------------------ |
| TS2322: Type 'X' is not assignable to type 'Y'              | Type mismatch                  |
| TS2339: Property 'X' does not exist on type 'Y'             | Missing property               |
| TS2304: Cannot find name 'X'                                | Not imported or defined        |
| TS2531: Object is possibly null                             | Strict null check              |
| TS2345: Type 'X' is not assignable to parameter of type 'Y' | Generic arg mismatch           |
| TS2769: Property 'X' has no initializer                     | Strict property initialization |

### tsconfig Strictness

| Option                       | Catches                  |
| ---------------------------- | ------------------------ |
| strict: true                 | All strict checks        |
| strictNullChecks             | null/undefined errors    |
| strictPropertyInitialization | Uninitialized properties |
| noImplicitAny                | Implicit any types       |

### Debug Tools

| Tool                   | Use For                                |
| ---------------------- | -------------------------------------- |
| Neovim                 | Edit files, inline errors, hover types |
| pnpm exec tsc --noEmit | Full project type check                |
| context7_query-docs    | TS documentation                       |
| codesearch             | Pattern examples                       |

---

# React

For React component and hooks issues: useEffect deps, re-render loops, lifecycle errors

## Step 1: GATHER

**REQUIRED:**

- Full error message and stack trace
- React/Next.js version
- Which component triggers the error

**TOOLS:**

- grep to find component definitions
- `bash: pnpm list react` for version
- React DevTools for component tree

## Step 2: REPRODUCE

**GOOD OUTPUT:**

```
Clicking "Submit" → TypeError: Cannot read properties of undefined
Expected: Form submits
Actual: Crash on submit
```

Describe the bug with:

- User interaction that triggers the error
- Expected behavior
- Actual behavior

## Step 3: ISOLATE

**Render debugging:**

```tsx
function DebugWrapper({ children }) {
  console.log("[DBG1] Rendering:", children?.type?.name);
  return children;
}
```

**useEffect debugging:**

```tsx
useEffect(() => {
  console.log("[DBG1] Effect running, deps:", { deps });
  return () => {
    console.log("[DBG1] Cleanup running");
  };
}, [deps]); // Check deps array
```

**State mutation detection:**

```tsx
// Add this to catch state mutations
const [state, setState] = useState(originalState);
useEffect(() => {
  if (state !== originalState) {
    console.warn("[DBG1] State mutated!");
  }
}, [state]);
```

## Step 4: ANALYZE

**Error Categories:**

| Category                    | Common Triggers                              |
| --------------------------- | -------------------------------------------- |
| useEffect deps              | Missing/extra deps, infinite loop            |
| Maximum update depth        | setState in render or useEffect without deps |
| cannot update during render | setState called in render body               |
| null children               | Passing null to component expecting children |
| stale closure               | Using stale variable in callback             |
| re-render loop              | setState triggering re-render                |
| unmounted component         | setState on unmounted component              |

## Step 5: FIX

```tsx
// BEFORE (bug - infinite loop):
useEffect(() => {
  setCount(count + 1); // Creates infinite loop
}, [count]);

// AFTER (fix):
useEffect(() => {
  setCount((c) => c + 1); // Functional update
}, []); // Run once

// OR with dependency:
useEffect(() => {
  if (shouldIncrement) {
    setCount((c) => c + 1);
  }
}, [shouldIncrement]);
```

```tsx
// BEFORE (bug - stale closure):
useEffect(() => {
  button.onClick = () => alert(count); // Stale!
}, []);

// AFTER (fix):
useEffect(() => {
  button.onClick = () => alert(count);
}, [count]); // Include dependency

// OR use ref:
const countRef = useRef(count);
countRef.current = count;
useEffect(() => {
  button.onClick = () => alert(countRef.current);
}, []);
```

**Checklist:**

- [ ] Addresses root cause
- [ ] Doesn't cause infinite loops
- [ ] Cleanup handles unmount

## Step 6: VERIFY

Verify the fix works:

- `bash: pnpm test` - Run existing tests
- Check component renders correctly in browser

**After applying a fix, you MUST:**

1. **First:** Run the verification command (tests or type check)
2. **Second:** Re-run the **original reproduction steps** (manually or via script)
3. **Third:** Confirm the bug no longer occurs

**Order matters:** Verify with command FIRST, then manually confirm.

If the issue still reproduces, return to **ISOLATE** and continue debugging.

## Reference

### useEffect Dependencies

| Pattern         | Issue                                     |
| --------------- | ----------------------------------------- |
| `[]`            | Runs once on mount                        |
| `[dep]`         | Runs when dep changes                     |
| Missing dep     | Stale closure                             |
| Object as dep   | Infinite loop (new reference each render) |
| Function as dep | Same as object                            |

### Common Errors

| Error                            | Cause                              |
| -------------------------------- | ---------------------------------- |
| Maximum update depth exceeded    | setState in useEffect without deps |
| Cannot update during render      | setState in render body            |
| useEffect has missing dependency | Dep array incomplete               |
| Render loop                      | setState triggering re-render      |
| Object is not valid as a child   | Passing non-element to children    |

### Debug Tools

| Tool            | Use For                      |
| --------------- | ---------------------------- |
| Neovim          | Edit files, inline errors    |
| React DevTools  | Component tree, props, state |
| Chrome DevTools | Browser debugging            |
| pnpm test       | Run tests                    |
| console.log     | Quick debugging              |

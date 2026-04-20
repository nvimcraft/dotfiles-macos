---
name: wcag-audit
description: Web accessibility expert for WCAG compliance, inclusive design, and assistive technology
compatibility: opencode
metadata:
  audience: ai agents
  platforms: "web"
  frameworks: "html, javascript, typescript, react"
  triggers: "alt, aria, focus, form, keyboard, label"
---

## Role

You are a web accessibility expert. Conduct audits, identify barriers, provide remediation.

## Quick Reference

| Step       | Action                                  |
| ---------- | --------------------------------------- |
| 1. CONFIRM | Get WCAG level (A/AA/AAA), target pages |
| 2. SCAN    | Run automated tools → collect baseline  |
| 3. ROUTE   | By issue type → check WCAG criteria     |
| 4. FIX     | Apply remediation pattern               |
| 5. VERIFY  | Retest with tools + manual check        |

## Key Rules

- MUST cite WCAG criterion before recommending fix
- MUST run automated tools before manual testing
- MUST distinguish automated vs manual failures
- MUST prioritize: blocker > serious > moderate > minor
- MUST verify each fix before proceeding

## Commands

- `axe <url>` - Run axe-core audit
- `pa11y <url>` - Run Pa11y CI test
- `lighthouse --preset accessibility` - Lighthouse score

---

# AI AGENT: Detection Workflow

MUST route based on code findings. Follow these tables.

## Step 1: Initial Scan

| If testing   | Use tool                          |
| ------------ | --------------------------------- |
| Any web page | axe DevTools                      |
| CI pipeline  | pa11y                             |
| Full audit   | lighthouse --preset accessibility |

## Step 2: Route by Code Pattern

| If code contains                        | Route to                  |
| --------------------------------------- | ------------------------- |
| `<img` without alt / alt=""             | [Images](#images)         |
| `<h1>` followed by `<h3>` / no headings | [Headings](#headings)     |
| `<div onClick` / `<span onClick`        | [Keyboard](#keyboard)     |
| input without label / placeholder only  | [Forms](#forms)           |
| `<a>` without text / "click here"       | [Links](#links)           |
| `<html` without lang                    | [Language](#language)     |
| `<title>` missing / generic             | [Page Title](#page-title) |
| Modal / dialog element                  | [Focus](#focus)           |
| role="button" / role="menu"             | [ARIA](#aria)             |
| form without error handling             | [Errors](#errors)         |

---

# Issue Categories

## Images

| WCAG  | Issue                | Fix                                    |
| ----- | -------------------- | -------------------------------------- |
| 1.1.1 | Missing alt          | Add `alt="description"`                |
| 1.1.1 | alt="" on meaningful | Add description or role="presentation" |
| 1.1.1 | "image of photo"     | Remove redundant prefix                |

**Fix Pattern:**

```jsx
// Meaningful
<img src="chart.png" alt="Sales increased 20% in Q3" />

// Decorative
<img src="decoration.png" alt="" role="presentation" />
```

## Headings

| WCAG  | Issue                 | Fix                     |
| ----- | --------------------- | ----------------------- |
| 1.3.1 | Skip level (h1→h3)    | Use sequential h1→h2→h3 |
| 1.3.1 | Empty heading         | Remove or add content   |
| 1.3.1 | div styled as heading | Use h1-h6 tag           |

**Fix Pattern:**

```jsx
<h1>Page Title</h1>
<h2>Section</h2>
<h3>Subsection</h3>
```

## Keyboard

| WCAG  | Issue               | Fix                   |
| ----- | ------------------- | --------------------- |
| 2.1.1 | div onClick         | Use `<button>`        |
| 2.1.1 | span onClick        | Use `<button>`        |
| 2.1.1 | Missing Enter/Space | Add onKeyDown handler |
| 2.1.2 | Tab trapped         | Allow escape to exit  |

**Fix Pattern:**

```jsx
// Button instead of div
<button onClick={handleAction}>Action</button>;

// Keyboard support on custom element
function handleKeyDown(e) {
  if (e.key === "Enter" || e.key === " ") {
    e.preventDefault();
    handleAction();
  }
}
<div role="button" tabIndex="0" onKeyDown={handleKeyDown}>
  Action
</div>;
```

## Forms

| WCAG  | Issue            | Fix                                                  |
| ----- | ---------------- | ---------------------------------------------------- |
| 3.3.2 | placeholder only | Add `<label>`                                        |
| 3.3.2 | Missing label    | Add `htmlFor` + label                                |
| 3.3.2 | Hidden label     | Make visible or provide aria-label AND visible label |

**Fix Pattern:**

```jsx
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// OR - hide label visually but keep for screen reader
<label htmlFor="search" className="sr-only">Search</label>
<input id="search" aria-label="Search" />
```

## Links

| WCAG  | Issue                          | Fix                        |
| ----- | ------------------------------ | -------------------------- |
| 2.4.4 | "click here" / "read more"     | Use descriptive text       |
| 2.4.4 | Empty link text                | Add descriptive text       |
| 2.4.4 | Same link text different pages | Add aria-label for context |

**Fix Pattern:**

```jsx
// Bad
<a href="/details">Click here</a>
<a href="/details">Read more</a>

// Good
<a href="/details">View Q3 sales report details</a>
<a href="/details">Read more about quarterly earnings</a>

// With aria-label for same link text
<a href="/product-a" aria-label="View Product A details">Details</a>
<a href="/product-b" aria-label="View Product B details">Details</a>
```

## Page Title

| WCAG  | Issue                       | Fix                            |
| ----- | --------------------------- | ------------------------------ |
| 2.4.2 | Missing title               | Add `<title>Page Name</title>` |
| 2.4.2 | Generic "Home"              | Add descriptive title          |
| 2.4.2 | Title changes on navigation | Use unique title per page      |

**Fix Pattern:**

```jsx
<head>
  <title>Q3 Sales Report - Dashboard</title>
</head>
```

## Language

| WCAG  | Issue                  | Fix                        |
| ----- | ---------------------- | -------------------------- |
| 3.1.1 | Missing lang attribute | Add lang="en" to html      |
| 3.1.1 | Wrong lang             | Correct to actual language |

**Fix Pattern:**

```jsx
<html lang="en">
  <!-- For multi-language, specify each element -->
  <p lang="es">Hola mundo</p>
</html>
```

## Skip Links

| WCAG  | Issue                    | Fix                          |
| ----- | ------------------------ | ---------------------------- |
| 2.4.1 | Missing skip link        | Add skiplink to main content |
| 2.4.1 | Hidden but not focusable | Ensure tabindex="0"          |

**Fix Pattern:**

```jsx
<body>
  <a href="#main" className="skip-link">Skip to main content</a>
  <nav>...</nav>
  <main id="main" tabIndex="-1">
```

## Focus

| WCAG  | Issue              | Fix                               |
| ----- | ------------------ | --------------------------------- |
| 2.4.7 | No visible focus   | Add :focus-visible styles via CSS |
| 2.4.3 | Modal focus trap   | Trap focus within modal           |
| 2.4.3 | Focus not restored | Return focus on close             |

**Note:** Add :focus-visible styles in your CSS. Use browser devtools to find elements needing focus styles.

**Fix Pattern:**

```jsx
// Focus trap in modal
function Modal({ isOpen, onClose, triggerRef }) {
  useEffect(() => {
    if (isOpen) {
      focusableRef.current?.focus();
    }
  }, [isOpen]);

  return isOpen ? (
    <div role="dialog" aria-modal="true" ref={trapRef}>
      ...
      <button
        onClick={() => {
          onClose();
          triggerRef.current?.focus();
        }}
      >
        Close
      </button>
    </div>
  ) : null;
}
```

## ARIA

| WCAG  | Issue                    | Fix                           |
| ----- | ------------------------ | ----------------------------- |
| 4.1.2 | role without aria-\*     | Add aria-labelledby/label     |
| 4.1.1 | Invalid role             | Use valid semantic HTML first |
| 4.1.2 | aria-hidden on focusable | Remove or set tabIndex="-1"   |

**Valid Combos:**

```jsx
<button role="menuitem">Menu Item</button>
<div role="dialog" aria-modal="true" aria-labelledby="title">...</div>
<div role="radiogroup" aria-labelledby="label">...</div>
<span role="img" aria-label="Chart showing growth">📈</span>
```

## Errors

| WCAG | Issue | Fix |
| 3.3.1 | No error identification| Add error message |
| 3.3.1 | Vague errors | Be specific: "Email is required" |
| 3.3.2 | Auto-submit on change | Use explicit submit button |

**Fix Pattern:**

```jsx
<label htmlFor="email">Email (required)</label>
<input id="email" required aria-invalid="true" aria-describedby="email-error" />
<span id="email-error" role="alert">Please enter a valid email address</span>
```

---

# AI AGENT: Evidence Requirements

Before claiming fix complete, MUST verify:

| Fix Type   | Verification                        |
| ---------- | ----------------------------------- |
| Images     | alt present in axe output           |
| Headings   | axe shows sequential levels         |
| Keyboard   | Tab reaches element, Enter triggers |
| Forms      | Label + input associated in DOM     |
| Links      | Link text describes destination     |
| Page Title | Title tag present in <head>         |
| Language   | lang on html element                |
| Skip Link  | Link in DOM, focus reaches it       |
| Focus      | :focus-visible styles applied       |
| Errors     | aria-invalid + role="alert"         |

---

# WCAG Level Checklist

## Level A (Required)

- [ ] 1.1.1 Non-text Content (alt text)
- [ ] 1.2.1 Audio-only / Video-only
- [ ] 1.3.1 Info & Relationships (semantic HTML)
- [ ] 1.3.2 Meaningful Sequence
- [ ] 1.4.1 Use of Color (not only cue)
- [ ] 2.1.1 Keyboard
- [ ] 2.1.2 No Keyboard Trap
- [ ] 2.4.1 Bypass Blocks (skip link)
- [ ] 2.4.2 Page Titled
- [ ] 2.4.3 Focus Order
- [ ] 2.4.4 Link Purpose
- [ ] 3.1.1 Language of Page
- [ ] 3.2.1 On Focus
- [ ] 3.2.2 On Input
- [ ] 3.3.1 Error Identification
- [ ] 3.3.2 Labels or Instructions
- [ ] 4.1.1 Parsing (valid HTML)
- [ ] 4.1.2 Name, Role, Value

## Level AA (Common Target)

- [ ] 1.4.4 Resize Text
- [ ] 1.4.5 Images of Text
- [ ] 1.4.10 Reflow
- [ ] 1.4.12 Text Spacing
- [ ] 2.4.5 Multiple Ways
- [ ] 2.4.6 Headings and Labels
- [ ] 2.4.7 Visible Focus
- [ ] 2.5.1 Pointer Gestures
- [ ] 2.5.2 Pointer Cancellation
- [ ] 2.5.3 Label in Name
- [ ] 2.5.4 Motion Actuation
- [ ] 3.1.2 Language of Parts
- [ ] 3.2.3 Consistent Navigation
- [ ] 3.2.4 Consistent Identification
- [ ] 3.3.3 Error Suggestion
- [ ] 3.3.4 Error Prevention

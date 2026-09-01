# Assignment 4: Parser for nanoC
## CS348 - Implementation of Programming Languages Lab
## IIT Guwahati

---

## Files

| File | Description |
|------|-------------|
| `a4_230101107.l` | Flex lexer specification for nanoC |
| `a4_230101107.y` | Bison/YACC parser specification for nanoC |
| `a4_230101107_test.nc` | Test file exercising all grammar rules |
| `Makefile` | Build system |
| `README.md` | This file |

---

## Build Instructions

```bash
make          # Generates lex.yy.c, y.tab.c, y.tab.h and compiles a.out
make run      # Runs the parser on the test file
make clean    # Removes all generated files
```

Manual build (as per assignment spec):
```bash
flex a4_230101107.l
yacc -d a4_230101107.y
gcc lex.yy.c y.tab.c
./a.out < a4_230101107_test.nc
```

---

## Grammar Changes Made

The nanoC grammar required several transformations to be suitable for YACC/Bison:

### 1. Optional Non-Terminals (opt suffixes)
All `opt` (optional) non-terminals were made explicit using new productions with an epsilon rule:

| Original | New non-terminal |
|----------|-----------------|
| `argument-expression-listopt` | `argument_expression_list_opt` |
| `init-declarator-listopt` | `init_declarator_list_opt` |
| `assignment-expressionopt` | `assignment_expression_opt` |
| `identifier-listopt` | `identifier_list_opt` |
| `block-item-listopt` | `block_item_list_opt` |
| `expressionopt` | `expression_opt` |
| `designationopt` | `designation_opt` |

### 2. Dangling-Else Ambiguity
Resolved using `%prec LOWER_THAN_ELSE` on the `if` rule without `else`, and declaring `ELSE` with higher precedence. This forces the `else` to bind to the nearest `if`.

### 3. Top-Level Structure
A `translation_unit` and `external_declaration` rule were added (standard C top-level structure) to support both function definitions and global declarations.

### 4. Hyphen → Underscore
All hyphenated non-terminal names (e.g., `primary-expression`) were converted to underscore form (e.g., `primary_expression`) since hyphens are not valid in YACC/C identifiers.

### 5. `cast-expression`
In nanoC, there is no explicit type-cast syntax (no `(type-name)` form), so `cast_expression` is defined as a pass-through to `unary_expression`.

---

## Test File Coverage

The test file `a4_230101107_test.nc` covers:

- All **type specifiers**: `int`, `char`, `short`, `long`, `float`, `double`, `signed`, `unsigned`, `void`, `_Bool`
- **Storage class**: `static`
- **Declarations**: simple, multiple, with initializers, arrays, designated initializers
- **All unary operators**: `&`, `*`, `+`, `-`, `~`, `!`
- **All binary operators**: arithmetic, bitwise, shift, relational, equality, logical
- **All assignment operators**: `=`, `*=`, `/=`, `%=`, `+=`, `-=`, `<<=`, `>>=`, `&=`, `^=`, `|=`
- **Conditional expression** (ternary `? :`)
- **Comma expression**
- **Postfix**: array subscript `[]`, function call `()`, `++`, `--`
- **Prefix**: `++`, `--`
- **All statement types**: labeled, compound, expression, selection (`if`, `if-else`), iteration (`while`, `do-while`, `for`), jump (`continue`, `break`, `return`)
- **`case` and `default` labels**
- **Function definitions**: with/without parameters, with ellipsis (`...`), static
- **Recursive function**
- **String literals**
- **Empty statements**
- **Nested if-else** (dangling-else)

---

## Notes

- The parser reports **"Parsing successful!"** on a valid nanoC program.
- Parse errors are reported with the message **"Parse error: ..."** to `stderr`.

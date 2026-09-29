# Safe Division

`solution.c` reads two integers `a` and `b` and prints `a / b`.
It crashes when `b` is 0.

Your job (Task 2 of the lab handbook):

1. Make a branch `solution-<reg_no>`.
2. Copy `solution.c` into a new file `<reg_no>_solution.c` (for example `2019331002_solution.c`).
3. Fix your copy: when `b` is 0 it must print exactly `Error: division by zero`.
4. Check with `make test REG=<reg_no>` until it says `0 failed`.
5. Commit with the message `Fix division by zero: <reg_no>`, push, open a pull request.
6. Check your pull request (one new file, exact commit message, tests pass), then merge it yourself.

| Command | What it does |
|---|---|
| `make build REG=<reg_no>` | compile your file |
| `make run REG=<reg_no>` | run it, type the input yourself |
| `make test REG=<reg_no>` | run all tests in `tests/` |
| `make clean` | delete the `build` folder |

Change nothing except your own `<reg_no>_solution.c`.

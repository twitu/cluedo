# CLUEDO

Modelling cluedo as a discrete optimization problem using MiniZinc

## Intructions

1. Follow [these instructions](https://www.minizinc.org/ide/) to install MiniZinc IDE
2. Download/Clone the repo
3. Start MiniZinc IDE and open a new project - select the `cluedo.mzp` file
4. Select `cluedo.mzn` tab and click run. Select `cluedo_0.mzd` or `cluedo_1.mzd` as data file to act as input.
5. VOILA! Cluedo solved.

## How it works

In brief, MiniZinc is a modeling language. You interact with it by defining models and constraints. It converts these into an intermediate language which it then passes to industrial grade solvers.

[Cluedo](https://en.wikipedia.org/wiki/Cluedo) is a fundamentally a constraints problem. Information is revealed by asking other player questions. This information narrows the possibility of suspect cards until there are only three cards left. This problem is effectively modelled in MiniZinc using sets.

## References

1. I was introduced to MiniZinc by this fantastic course called [Basic Modeling for Discrete Optimization on Coursera](https://www.coursera.org/learn/basic-modeling)
2. [therealsaumil's](https://github.com/therealsaumil) awesome [implementation](https://github.com/therealsaumil/cluedo-game) of the full cluedo game which I relied upon heavily for game data and comparing correctness.

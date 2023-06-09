# DVwR_Case_Study_2

Variables for GOI expression

- `condition`: Redundant with `time_treatment`
- `Gene`: Letter = class, digit = gene
- `mean_count`: RNAseq
- `time`: How long the treatment was
- `treatment`: 2 treatments & control (no control in this expt)
  - Dd:    Diff,    Treatment
  - Dx:    Diff, No Treatment
  - xd: No Diff,    Treatment
  - xx: No Diff, No Treatment 


| `treatment` | Differentiation | Treatment |
|-|-|-|
| Dd | `TRUE` | `TRUE` |
| Dx | `TRUE` | `FALSE` | 
| xd | `FALSE` | `TRUE` |
| xx | `FALSE` | `FALSE` |

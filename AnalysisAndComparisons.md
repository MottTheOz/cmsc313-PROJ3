**Analysis And Comparisons of differing optimization levels**

-O0 (No Optimization)
No optimizations performed. The code is line by line assembled and translated from C. The goal of fast compilation and convenient debugging keeps the structure unchanged. Everything, including all the variables (counters, buffers), are read/written from stack memory (offsets relative to %rbp) for each and every calculation step. As such, the most verbose assembly is generated with lots of movs because all temporaries are calculated anew.

-O1 (Basic Optimization)
Structural improvements minimize code size and runtime at the cost of moderate compile time overhead. Stack accesses in the output have decreased noticeably. Local variables and frequently used information (offset calculation, counter for inner loop) are placed in general-purpose registers (%eax, %rbx, etc.). Unnecessary calculations and trivial branches (padding conditionals) are optimized resulting in compact, short assembly code compared to -O0.

-O3 (Aggressive Optimization)
-O3 focuses on performance, leading to structural changes. Along with reduced memory accesses, loop unrolling (of 16-byte formatting loops) and possibly other optimizations, like vectorization, take place, resulting in a larger, more complicated, yet faster assembly than -O1.

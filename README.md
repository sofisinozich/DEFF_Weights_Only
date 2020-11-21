# DEFF_Weights_Only
Stata and R code for computing design effects when only survey weights and average DEFFs are available, following [West and McCabe (2012)](https://journals.sagepub.com/doi/pdf/10.1177/1536867X1201200410).

The original Stata code is by West and McCabe; the R implementation is a direct translation by Sinozich.

## R implementation comments

You can verify the results from `deft2corr()` against Table 1 in West and McCabe (2012). Note that exponentiated values may differ slightly due to varied handling of floating point numbers across software packages.

```
# Proportion: Nasal administration
deft2corr(0.3627,0.0257,2,1.3528,0)

# AOR: NMPM vs. MPNM
deft2corr(1.7938,0.5310,2,1.4987,1)

# AOR: NMO vs. MPNM
deft2corr(2.0390,0.5172,2,1.5098,1)
```
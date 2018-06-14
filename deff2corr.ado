program define deff2corr
   capture log close
   quietly log using "deff2corr.log", replace
   di ""
   if `5' == 1 {
      di "Exponentiated Estimate: " exp(`1')
      di "95% CI LL: " exp(`1' - 1.96*`2'*(sqrt(`3')/sqrt(`4')))
      di "95% CI UL: " exp(`1' + 1.96*`2'*(sqrt(`3')/sqrt(`4')))
   }
   if `5' == 0 {
      di "Estimate: " `1'
      di "95% CI LL: " `1' - 1.96*`2'*(sqrt(`3')/sqrt(`4'))
      di "95% CI UL: " `1' + 1.96*`2'*(sqrt(`3')/sqrt(`4'))
   }
   di "Z statistic: " `1' / (`2'*(sqrt(`3')/sqrt(`4')))
   if `1' / (`2'*(sqrt(`3')/sqrt(`4'))) > 0 di "p-value: " 2*(1-normal(`1' / (`2'*(sqrt(`3')/sqrt(`4')))))
   if `1' / (`2'*(sqrt(`3')/sqrt(`4'))) <= 0 di "p-value: " 2*(normal(`1' / (`2'*(sqrt(`3')/sqrt(`4')))))
end
exit

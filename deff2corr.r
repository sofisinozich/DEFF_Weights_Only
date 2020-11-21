deft2corr <- function(estimate,linearizedSE,avgDEFF,DEFFwts,eform) {
   digits <- nchar(gsub("[0-9]+\\.","",estimate))
   ll <- estimate-1.96*linearizedSE*(sqrt(avgDEFF)/sqrt(DEFFwts))
   ul <- estimate+1.96*linearizedSE*(sqrt(avgDEFF)/sqrt(DEFFwts))
   
   if (eform == 1) {
      cat(paste0("Exponentiated Estimate: ",round(exp(estimate),digits),"\n"))
      cat(paste0("95% CI LL: ",round(exp(ll),digits),"\n"))
      cat(paste0("95% CI UL: ",round(exp(ul),digits),"\n"))
   }
   
   else if (eform == 0) {
      cat(paste0("Estimate: ",estimate,"\n"))
      cat(paste0("95% CI LL: ",round(ll,digits),"\n"))
      cat(paste0("95% CI UL: ",round(ul,digits),"\n"))
   }
   
   z_stat <-estimate/(linearizedSE*(sqrt(avgDEFF)/sqrt(DEFFwts)))
   pvalue <- ifelse(z_stat>0,2*(1-pnorm(z_stat)),2*(pnorm(z_stat)))
   
   cat(paste0("Z statistic: "), round(z_stat,digits),"\n")
   cat(paste0("p-value: "),pvalue,"\n")
   
   invisible(list(ll=ll,ul=ul,z_stat=z_stat,pvalue=pvalue))
}
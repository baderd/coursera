#'---
#' title: Statistical Inference - Assignemnt
#' author: Daniel Bader
#' output: 
#'   pdf_document:
#'     pandoc_args: ["+RTS", "-K64m","-RTS"]
#'---

#' ## The Effect of Vitamin C on Tooth Growth in Guinea Pigs

library(datasets)
library(beeswarm)
data(ToothGrowth)
tg= ToothGrowth

#' ### Basic data summary and exploratory data analyses 
#' 
#' The response is the length of odontoblasts (teeth) in each of 10 guinea pigs 
#' at each of three dose levels of Vitamin C (0.5, 1, and 2 mg) 
#' with each of two delivery methods (orange juice or ascorbic acid).
#' 
#' I would not assume that the order of the pigs is the same 
#' when applying another dose or vitamin source, so I will use unpaired tests.
#'
#' Dimensions of the data set: 
dim(tg)
#' Tooth length distribution:
summary(tg$len)
#' Contingency table for vitamin `dose` and vitamin `supp`lementary methods
#' (OJ=orange juice, VC=ascorbic acid):
with(tg, table(dose, supp))
#' 
#' Length comparison by dose and delivery methods:
#+ fig.show='hold'
par(mfrow=c(1,2))
beeswarm(len~ dose, data=tg,
         ylab='Tooth length',
         xlab='vitamin dose [mg]',
         pwcol=ifelse(tg$supp=='OJ', 'orange', 'green'),
         pch=20
)
legend('topleft', c('OJ','VJ'), col=c('orange', 'green'), pch=20)
boxplot(len~ supp, data=tg,
        ylab='Tooth length',
        xlab='delivery method'
)
par(mfrow=c(1,1))


#' ### Compare tooth growth by supp and dose
#' 
#' I will perform a T-test to decide whether tooth length is different between
#' the two delivery methods. Based on the analysis above I choose unequal variance
#' for `OJ` and `VC`.
res_supp= t.test(len~ supp, data=tg, var.equal=FALSE)
res_supp
#'
#'  I do not reject the Null-hypothesis that the mean length for pigs fed on 
#'  acid is the same than for those fed on juice with a 
#'  Pvalue=`r signif(res_supp$p.value,2)`> 5% 
#'  and a confidence interval [`r res_supp$conf.int`] including the zero.
#' 
#' Additionally, I perform 3 T-tests with unequal variance between 
#' doses of 0.5, 1, 2.
#' 
res_dose= lapply(unique(tg$dose), 
                 function(d)
                     t.test(len~ dose, data=tg[tg$dose!=d, ], var.equal=F)
)
res_dose
#' 
#' All 3 tests reject the Null-hypothesis at type 1 error of alpha<5%.
#' 
#' 
#' 
#' ### Conclusions
#' 
#' Tooth growth in Guinea Pigs does correlate with dose of vitamin C, but not
#' with delivery method of the vitamin. However, the latter effect is at the
#' borderline of signifcance and a larger cohort should be used to distinguish
#' the effect of the delivery method.



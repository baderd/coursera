#q1
signif(t.test(df$Baseline, df$Week.2, paired=T, var.equal=T)$p.value,2)

#q2
# sqrt(n)(X-mu0)/s > Z
# X= Z*s/sqrt(n) + mu0
# mu0 = X - Z*s/sqrt(n)
# homework p5/14
3- c(qnorm(.025), qnorm(.975)) * 1.1 / 10

1100- c( qt(.975,8), qt(.025, 8) ) * 30 / sqrt(9)

#q3
pbinom(2,4,0.5, F)

#hw7
ppois(15800 - 1, lambda = 520*30, lower.tail = FALSE)

#q4
ppois(10, lambda = 1787/100)

#q5, hw8
#se= s * sqrt (1/n1 + 1/n2)
#teststat= (m1-m2) / se
# pv = 2 * pnorm(-abs(teststat))
popvar= (8*1.5^2 + 8*1.8^2)/(18-2)
sqrt(popvar)
2* pnorm(-abs( (-3-1)/ sqrt(popvar) / sqrt(2/9) ))

#q7
power.t.test(n=100, delta=0.01, sd=0.04, 
             sig.level = 0.05, alternative = 'o', type='o')

#q8
power.t.test(power=0.90, delta=0.01, sd=0.04, 
             sig.level = 0.05, alternative = 'o', type='o')

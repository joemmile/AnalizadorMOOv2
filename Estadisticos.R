library(PMCMR)
library(PMCMRplus)
write("\\documentclass{article}", "salida.tex", append=FALSE)
write("\\title{Pruebas estad'isticas}", "salida.tex", append=TRUE)
write("\\usepackage{colortbl}", "salida.tex", append=TRUE)
write("\\usepackage[table*]{xcolor}", "salida.tex", append=TRUE)
write("\\xdefinecolor{gray95}{gray}{0.65}", "salida.tex", append=TRUE)
write("\\xdefinecolor{gray25}{gray}{0.8}", "salida.tex", append=TRUE)
write("\\author{}", "salida.tex", append=TRUE)
write("\\begin{document}", "salida.tex", append=TRUE)
write("\\maketitle", "salida.tex", append=TRUE)
write("\\begin{table*}[ht!]", "salida.tex", append=TRUE)
write("\\scriptsize", "salida.tex", append=TRUE)
write("\\caption{p-values}", "salida.tex", append=TRUE)
write("\\centering", "salida.tex", append=TRUE)
write("\\begin{tabular}{", "salida.tex", append=TRUE)
cadena<-""
write("|c||c||c||c|}\\hline","salida.tex",append=TRUE)
write("Indicador & 1-2\\\\\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ1/N03-DTLZ1_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ1-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ1-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ1-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ1-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ1-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ2/N03-DTLZ2_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ2-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ2-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ2-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ2-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ2-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ3/N03-DTLZ3_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ3-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ3-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ3-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ3-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ3-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ4-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ5/N03-DTLZ5_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ5-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ5-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ5-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ5-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ5-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ6/N03-DTLZ6_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ6-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ6-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ6-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ6-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ6-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ7/N03-DTLZ7_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ7-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ7-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ7-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ7-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ7-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ1/N05-DTLZ1_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ1-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ1-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ1-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ1-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ1-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ2/N05-DTLZ2_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ2-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ2-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ2-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ2-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ2-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ3/N05-DTLZ3_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ3-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ3-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ3-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ3-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ3-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ4/N05-DTLZ4_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ4-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ4-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ4-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ4-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ4-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ5/N05-DTLZ5_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ5-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ5-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ5-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ5-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ5-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ6/N05-DTLZ6_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ6-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ6-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ6-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ6-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ6-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N05-DTLZ7/N05-DTLZ7_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N05-DTLZ7-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ7-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ7-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ7-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N05-DTLZ7-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ1/N10-DTLZ1_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ1-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ1-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ1-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ1-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ1-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ2/N10-DTLZ2_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ2-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ2-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ2-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ2-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ2-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ3/N10-DTLZ3_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ3-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ3-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ3-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ3-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ3-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ4/N10-DTLZ4_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ4-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ4-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ4-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ4-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ4-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ5/N10-DTLZ5_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ5-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ5-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ5-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ5-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ5-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ6/N10-DTLZ6_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ6-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ6-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ6-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ6-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ6-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
datosAlg_igd0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_IGD_Alg0")
datosAlg_igdplus0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_IGDPlus_Alg0")
datosAlg_gs0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_GS_Alg0")
datosAlg_hv0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_HV_Alg0")
datosAlg_epsilon0<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_Epsilon_Alg0")
datosAlg_igd1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_IGD_Alg1")
datosAlg_igdplus1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_IGDPlus_Alg1")
datosAlg_gs1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_GS_Alg1")
datosAlg_hv1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_HV_Alg1")
datosAlg_epsilon1<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N10-DTLZ7/N10-DTLZ7_Epsilon_Alg1")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N10-DTLZ7-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ7-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ7-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ7-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N10-DTLZ7-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
write("\\end{tabular}","salida.tex",append=TRUE)
write("\\end{table*}","salida.tex",append=TRUE)
write("\\end{document}","salida.tex",append=TRUE)

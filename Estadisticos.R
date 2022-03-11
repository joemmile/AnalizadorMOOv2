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
write("|c||c||c||c||c||c||c||c||c||c||c||c||c||c||c||c|}\\hline","salida.tex",append=TRUE)
write("Indicador & 1-2 & 1-3 & 1-4 & 2-3 & 2-4 & 3-4\\\\\\hline","salida.tex",append=TRUE)
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
datosAlg_igd2<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGD_Alg2")
datosAlg_igdplus2<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGDPlus_Alg2")
datosAlg_gs2<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_GS_Alg2")
datosAlg_hv2<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_HV_Alg2")
datosAlg_epsilon2<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_Epsilon_Alg2")
datosAlg_igd3<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGD_Alg3")
datosAlg_igdplus3<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_IGDPlus_Alg3")
datosAlg_gs3<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_GS_Alg3")
datosAlg_hv3<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_HV_Alg3")
datosAlg_epsilon3<-read.table("C:/Users/joemmile/Documents/NetBeansProjects/AnalizarMOOv2/data/N03-DTLZ4/N03-DTLZ4_Epsilon_Alg3")
Datos_igd <- data.frame(c(datosAlg_igd0$V1),c(datosAlg_igd1$V1),c(datosAlg_igd2$V1),c(datosAlg_igd3$V1))
Datos_igdplus <- data.frame(c(datosAlg_igdplus0$V1),c(datosAlg_igdplus1$V1),c(datosAlg_igdplus2$V1),c(datosAlg_igdplus3$V1))
Datos_gs <- data.frame(c(datosAlg_gs0$V1),c(datosAlg_gs1$V1),c(datosAlg_gs2$V1),c(datosAlg_gs3$V1))
Datos_hv <- data.frame(c(datosAlg_hv0$V1),c(datosAlg_hv1$V1),c(datosAlg_hv2$V1),c(datosAlg_hv3$V1))
Datos_Epsilon <- data.frame(c(datosAlg_epsilon0$V1),c(datosAlg_epsilon1$V1),c(datosAlg_epsilon2$V1),c(datosAlg_epsilon3$V1))
pvalueIGD <- kruskal.test(Datos_igd)$p.value
pvalueIGDplus <- kruskal.test(Datos_igdplus)$p.value
pvalueGS <- kruskal.test(Datos_gs)$p.value
pvalueHV <- kruskal.test(Datos_hv)$p.value
pvalueEpsilon <- kruskal.test(Datos_Epsilon)$p.value
cadena<-"N03-DTLZ4-IGD &"
if(pvalueIGD<0.05){
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-2"]
cadena <-paste(cadena,pvalueIGD,"&")
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-3"]
cadena <-paste(cadena,pvalueIGD,"&")
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["1-4"]
cadena <-paste(cadena,pvalueIGD,"&")
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["2-3"]
cadena <-paste(cadena,pvalueIGD,"&")
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["2-4"]
cadena <-paste(cadena,pvalueIGD,"&")
pvalueIGD <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igd))["3-4"]
cadena <-paste(cadena,pvalueIGD,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-IGD+ &"
if(pvalueIGDplus<0.05){
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-2"]
cadena <-paste(cadena,pvalueIGDplus,"&")
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-3"]
cadena <-paste(cadena,pvalueIGDplus,"&")
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["1-4"]
cadena <-paste(cadena,pvalueIGDplus,"&")
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["2-3"]
cadena <-paste(cadena,pvalueIGDplus,"&")
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["2-4"]
cadena <-paste(cadena,pvalueIGDplus,"&")
pvalueIGDplus <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_igdplus))["3-4"]
cadena <-paste(cadena,pvalueIGDplus,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-GS &"
if(pvalueGS<0.05){
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-2"]
cadena <-paste(cadena,pvalueGS,"&")
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-3"]
cadena <-paste(cadena,pvalueGS,"&")
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["1-4"]
cadena <-paste(cadena,pvalueGS,"&")
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["2-3"]
cadena <-paste(cadena,pvalueGS,"&")
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["2-4"]
cadena <-paste(cadena,pvalueGS,"&")
pvalueGS <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_gs))["3-4"]
cadena <-paste(cadena,pvalueGS,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-HV &"
if(pvalueHV<0.05){
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-2"]
cadena <-paste(cadena,pvalueHV,"&")
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-3"]
cadena <-paste(cadena,pvalueHV,"&")
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["1-4"]
cadena <-paste(cadena,pvalueHV,"&")
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["2-3"]
cadena <-paste(cadena,pvalueHV,"&")
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["2-4"]
cadena <-paste(cadena,pvalueHV,"&")
pvalueHV <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_hv))["3-4"]
cadena <-paste(cadena,pvalueHV,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
cadena<-"N03-DTLZ4-Epsilon &"
if(pvalueEpsilon<0.05){
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-2"]
cadena <-paste(cadena,pvalueEpsilon,"&")
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-3"]
cadena <-paste(cadena,pvalueEpsilon,"&")
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["1-4"]
cadena <-paste(cadena,pvalueEpsilon,"&")
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["2-3"]
cadena <-paste(cadena,pvalueEpsilon,"&")
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["2-4"]
cadena <-paste(cadena,pvalueEpsilon,"&")
pvalueEpsilon <- get.pvalues(PMCMRplus::kwAllPairsNemenyiTest(Datos_Epsilon))["3-4"]
cadena <-paste(cadena,pvalueEpsilon,"\\\\")
write(cadena, "salida.tex", append=TRUE)
}else{
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","&")
cadena <-paste(cadena,"-","\\\\")
write(cadena, "salida.tex", append=TRUE)}
write("\\hline","salida.tex",append=TRUE)
write("\\end{tabular}","salida.tex",append=TRUE)
write("\\end{table*}","salida.tex",append=TRUE)
write("\\end{document}","salida.tex",append=TRUE)

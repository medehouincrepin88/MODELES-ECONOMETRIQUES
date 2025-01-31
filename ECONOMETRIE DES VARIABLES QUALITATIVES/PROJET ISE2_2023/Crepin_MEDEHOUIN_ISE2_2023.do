

**{Nous définissons notre chemin d'acces}**

cd "D:\ENSAE\ISE 2\SEMESTRE 2\Econometrie des variables qualitatives\Projet\Projet_Var_Qual"





*********** 		 ****************
*********	 Partie 1 	***********
***********			 ****************

***  A- Afrobarometer round 9, Bénin  ****


**  {Nous chargeons ensuite la base de donnée "Afrobarometer round 9, Bénin"} **

use "afrobarometer_release-dataset_ben_r9_fr_2023-03-01.dta", clear  




*{ 1- Nous construisons une variable dichotomique qui permet d'identifier les personnes vaccinées contre la Covid-19 }*



gen vaccination =.
replace vaccination = 1 if Q58A == 1 
recode vaccination (.= 0)

*Definir un label pour la variable
label var vaccination "Etre vacciné ou non contre la contre la Covid-19"

label define label_vaccination 1"Vacciné" 0"Pas vacciné"  

*Appliquer les labels pour la variable créée
label values vaccination label_vaccination


*Tabuler la variable
tab vaccination
 
 *drop vaccination
 
*{2- Un tableau descriptif des différentes variables que nous jugeons pertinentes pour étudier les raisons de la vaccination }*
 
 
*Recodage de la variable  "Q59. Confiance au gouvernement pour assurer que n'importe quel vaccin du COVID-19"


gen confiance =.
replace confiance = 1 if Q59 == 1 
replace confiance = 2 if Q59 == 2 
replace confiance = 2 if Q59 == 3 
recode confiance (.= 3)

*Definir un label pour la variable
label var confiance "A quel point faites-vous confiance au gouvernement pour assurer que n'importe quel vaccin du COVID-19 ?"

label define lab_confiance 1"Pas de confiance" 2"Un peu de confiance"  3"Beaucoup de confiance"

*Appliquer les labels pour la variable créée
label values confiance lab_confiance


*Tabuler la variable
tab confiance
 
 
 * Recodage de la variable  "Q60. A quel point diriez-vous que le gouvernement actuel conduit bien ou mal la gestion de la réponse de la pandémie de COVID-19? "

 
generate gestion_gouver =.
replace gestion_gouver = 1 if Q60 == 1
replace gestion_gouver = 1 if Q60 == 2
replace gestion_gouver = 2 if Q60 == 3
recode gestion_gouver (.=3) 

*Definir un label pour la variable
label var gestion_gouver "A quel point diriez-vous que le gouvernement actuel conduit bien ou mal la gestion de la réponse de la pandémie de COVID-19?"

label define lab_gestion_gouver 1"Mal" 2"Bien"  3"Très bien"

*Appliquer les labels pour la variable créée
label values gestion_gouver lab_gestion_gouver


*Tabuler la variable
tab gestion_gouver
 
 
 
 * Recodage de la variable  "Q61C. Le gouvernement s'assure t-il que les établissements de santé disposent des ressources adéquates pour répondre à la pandémie de COVID-19 "
 

  generate lutte_covid =.
replace lutte_covid = 1 if Q61C == 0
replace lutte_covid = 2 if Q61C == 1
replace lutte_covid = 2 if Q61C == 2
recode lutte_covid (.=3) 

*Definir un label pour la variable
label var lutte_covid "Le gouvernement s'assure t-il que les établissements de santé disposent des ressources adéquates pour répondre à la pandémie de COVID-19?"

label define label_lutte_covid 1"Pas du tout satisfait" 2"Assez satisfait"  3"Très satisfait"

*Appliquer les labels pour la variable créée
label values lutte_covid label_lutte_covid


*Tabuler la variable
tab lutte_covid
 


 * Recodage de la variable  "Q74. Combien de fois recevez-vous des informations provenant des sources suivantes : radio, télévison, internet, presse ecrite , media?"
 


**Les différentes sources d'informations des individus

* A partir de la radio * 
generate info_radio =.
replace info_radio = 0 if Q74A == 0
replace info_radio = 0 if Q74A== 1
replace info_radio = 1 if Q74A == 2
replace info_radio = 1 if Q74A == 3
recode info_radio (.=2)
 
 
*Definir un label pour la variable
label var info_radio "Recevoir des informations provenant de la radio ?"

label define lab_info_radio 0"Pas vraiment" 1"Un peu"  2"Toujours"

*Appliquer les labels pour la variable créée
label values info_radio lab_info_radio
 
 tab info_radio
 
 
** A partir de la television 

* generate info_tele = 0 if Q74B == 0
*replace info_tele = 0 if Q74B == 1
*replace info_tele = 1 if Q74B == 2
*replace info_tele = 1 if Q74B == 3
*replace info_tele = 2 if Q74B == 4
 
 
*Definir un label pour la variable
*label var info_tele "Recevoir des informations provenant de la télévison ?"

*label define lab_info_tele 0"Pas vraiment" 1"Un peu"  2"Toujours"

*Appliquer les labels pour la variable créée
*label values info_tele lab_info_tele



** A partir de la presse ecrite 

* generate info_ecrit = 0 if Q74C == 0
*replace info_ecrit = 0 if Q74C == 1
*replace info_ecrit = 1 if Q74C == 2
*replace info_ecrit = 1 if Q74C == 3
*replace info_ecrit = 2 if Q74C == 4
 

*Definir un label pour la variable
*label var info_ecrit "Recevoir des informations provenant de la presse ecrite ?"

*label define lab_info_ecrit 0"Pas vraiment" 1"Un peu"  2"Toujours"

*Appliquer les labels pour la variable créée
*label values info_ecrit lab_info_ecrit


*** A partir de la presse internet  
 
 *generate info_internet = 0 if Q74D  == 0
*replace info_internet = 0 if Q74D  == 1
*replace info_internet = 1 if Q74D == 2
*replace info_internet = 1 if Q74D == 3
*replace info_internet = 2 if Q74D == 4


*Definir un label pour la variable
*label var info_internet "Recevoir des informations provenant de la presse internet ?"

*label define lab_info_internet 0"Pas vraiment" 1"Un peu"  2"Toujours"

*Appliquer les labels pour la variable créée
*label values info_internet lab_info_internet


*** A partir de la media  

 *generate info_media = 0 if Q74E == 0
*replace info_media = 0 if Q74 == 1
*replace info_media = 1 if Q74E == 2
*replace info_media = 1 if Q74E == 3
*replace info_media = 2 if Q74E == 4
 

 *Definir un label pour la variable
*label var info_media "Recevoir des informations provenant de la media ?"

*label define lab_info_media 0"Pas vraiment" 1"Un peu"  2"Toujours"

*Appliquer les labels pour la variable créée
*label values info_media lab_info_media
 

*** Recodage de la variable Âge 

recode Q1 (18/25 = 1) (26/35 = 2) (36/45 = 3) (46/55=4) (56/65=5) (66/90=6), generate(class_age) 

 *Definir un label pour la variable
label var class_age "La tranche d'age"

* Definir les classe age
label define lab_class_age 1"18-25" 2"26-35" 3"36-45" 4"46-55" 5"56-65" 6"Plus de 66"

*Appliquer les labels pour les deux variables creer
label values class_age lab_class_age

*Tabuler la variable
tab class_age
 
 ************** Recodage de la variable niveau d'instruction ********************
 
 generate education = 0 if Q94 == 0
replace education = 0 if Q94 == 1
replace education = 1 if Q94 == 2
replace education = 1 if Q94 == 3
replace education =2 if Q94 == 4
replace education =2 if Q94 == 5
replace education = 3 if Q94 == 6
replace education = 3 if Q94 == 7
replace education = 3 if Q94 == 8
replace education = 3 if Q94 == 9

 *Definir un label pour la variable
label var education "Le niveau d'education"


label define lab_education 0"Aucune instruction" 1"Primaire" 2"Sécondaire" 3"Supérieur" 

*Appliquer les labels pour les deux variables creer
label values education lab_education

*Tabuler la variable
tab education
 

 ************** Recodage de la variable réligion  ********************
 


* recode Q95 ( 0 = 0) (1/17 = 1) (30/33= 1) (100 =1) (18/24=2) (25/29=3) (34 = 3), generate(religion) 

 *Definir un label pour la variable
*label var religion "La réligion"
 
*label define lab_religion 0"Aucune religion" 1"Chretien" 2"Musulman" 3"Autre" 

*Appliquer les labels pour les deux variables creer
*label values religion lab_religion

*Tabuler la variable
*tab religion

*drop if religion == 9995 
 
 ************** Recodage de la variable condition de vie  ********************
 *generate cond_vie = 0 if Q4B == 1
*replace cond_vie = 1 if Q4B == 2
*replace cond_vie = 1 if Q4B == 3
*replace cond_vie = 2 if Q4B == 4
*replace cond_vie = 2 if Q4B == 5

*Definir un label pour la variable
*label var religion "La condition de vie "


*label define labe_cond_vie 0"	Mauvaise" 1"Moyenne" 2"Bonne" 

*Appliquer les labels pour les deux variables creer
*label values cond_vie labe_cond_vie

*Tabuler la variable
*tab cond_vie

generate sexe = Q101

*Definir un label pour la variable
label var sexe "Le sexe "


label define labe_sexe 1"Homme" 2"Femme"

*Appliquer les labels pour les deux variables creer
label values sexe labe_sexe

*Tabuler la variable
tab sexe


******** Nos variables explicatives*****

global explicatives sexe class_age education confiance gestion_gouver lutte_covid  info_radio URBRUR 

 foreach x of varlist $explicatives {
	tabout `x'  vaccination using "Part1_A_var_expl.xls", append c(freq col)  dpcomma h3("Tableau`x'") stats(chi2) 
}



*[iw=withinwt_hh]

 foreach x of varlist $explicatives {
	tabout `x'  vaccination[iw=withinwt_hh] using "Part1_A_var_expl_ponder.xls", append c(freq col)  dpcomma h3("Tableau`x'") 
}




*Analyse de la correlation 
pwcorr vaccination $explicatives, star(0.05)


 ************** {3- Estimer puis présenter dans un tableau synthétique les coefficients des modèles logit, probit et OLS du statut de vaccination.} ***************

 
 global explicatives  i.(sexe class_age education confiance gestion_gouver lutte_covid  info_radio URBRUR)   // On fixe pas une modalité de reference si le codage est 0 et 1,   a pas ça, on fixe une modalité  de reference

  * Modele logit

logit vaccination $explicatives, robust 
 
eststo mod1

outreg2 [mod1] using "Part1_A_coeff.xls", ctitle("Coeff Logit")  aster label addstat(R2 McFadden, e(r2_p),Observations, e(N)) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9) nocon nor2 excel dec(3) noobs replace 


* Modele probit
probit vaccination $explicatives, robust 

eststo mod2

outreg2 [mod2] using "Part1_A_coeff.xls", ctitle("Coeff Probit")  aster label addstat(R2 McFadden, e(r2_p), Observations, e(N)) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9) nocon nor2 excel dec(3) noobs append 

* Modele OLS

regress vaccination $explicatives, robust 

eststo mod3

outreg2 [mod3] using "Part1_A_coeff.xls", ctitle("Coeff OLS")  aster label addstat(R2 McFadden, e(r2), Observations, e(N)) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9) nocon nor2 excel dec(3) noobs append 

* 4. Estimer les Odds ratio et les effets marginaux de la variable « vaccination» en utilisant un logit. Assurez-vous d'avoir effectué les différents tests de validation.

* Odds ratios

logit vaccination $explicatives, robust or

eststo OR

// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 
ereturn list

outreg2 [OR] using "Part1_A_Odds.xls", eform ctitle("Odds Ratios") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p))  addtext(Cragg-Uhler/Nagelkerke, 0.199, Correct prediction rate, 66.58% , Area under ROC curve, 0.7269, Hosmer–Lemeshow test, 0.3671 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) replace


 
 ** Estimation des  effets marginaux 

*foreach x of varlist sexe class_age education confiance gestion_gouver lutte_covid  info_radio URBRUR {
	
*	tab `x', gen(`x')
*}
 
 
*logit vaccination sexe2 class_age2-class_age6 education1-education3 confiance2-confiance3 gestion_gouver2-gestion_gouver3 lutte_covid2-lutte_covid3 info_radio1-info_radio2 URBRUR2, robust


margins, dydx (_all) post

outreg2 using "Part1_A_Odds.xls",ctitle("Effets marginaux") aster label append excel
 

 
 
 
 ****Quel est le taux de bonne prédiction de votre modèle à 50%, 70% et 80% ?
 

logit vaccination $explicatives, robust or

* le taux de bonne prédiction de votre modèle à 50%
estat classification, cutoff(0.5)

*le taux de bonne prédiction de votre modèle à 70%
estat classification, cutoff(0.7)

*le taux de bonne prédiction de votre modèle à 80%
estat classification, cutoff(0.8)


preserve
 
outreg2 [mod1] using "Nouveaux_coeff.xls", ctitle("Ancien modele") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p))  addtext(Cragg-Uhler/Nagelkerke, 0.199, Correct prediction rate, 66.58% , Area under ROC curve, 0.7269, Hosmer–Lemeshow test, 0.3671 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) replace
 

* 5. Faire un tirage aléatoire stratifié (suivant le milieu de résidence) parmi les non vaccinés pour obtenir un nouvel échantillon dans lequel les personnes non vaccinées représenteraient 40%
 
 tab vaccination URBRUR, freq row
 
  tab vaccination 
* Dans notre cas, les personnes vaccinées représentent une proportion de 52%. Nous allons donc faire le tirage aléatoire parmi les non vaccinées de telle sorte que notre nouvel échantillon soit composé de 60% des personnes vaccinées. 


* Notre nouvelle taille d'échantillon
* Si le nombre des personnes vaccinées représentent 60%, C'est à dire 624, on obtient donc : 624 ---> 60% alors x ---> 40%
display 624*40/60 
display as txt " La nouvelle taille d'échantillon n = " as result 624 + 416  // Soit n = 1040 

* Tirage aléatoire stratifié (suivant le milieu de résidence)

tab vaccination URBRUR, nofreq row // On remarque la proportion des personnes non vaccinées en milieu urbain est de 51.91% et ceux en milieu rural de 48.09%



 * Milieu Urbain
display as txt " La taille des personnes vaccinées en milieu urbain est = " as result 416*0.5191 // soit 216 personnes 




sample  216 if vaccination == 0 & URBRUR == 1, count 

* Milieu rural 

display as txt " La taille des personnes vaccinées en milieu rural est = " as result 416*0.4809 // soit 248 personnes

sample  200 if vaccination == 0 & URBRUR == 2, count 




tab vaccination

tab vaccination URBRUR

*6. Refaire l'estimation de la question 2. Comparer dans un tableau les coefficients des deux modèles logit. Commenter les résultats (maximum 10 lignes).


logit vaccination $explicatives, robust or

eststo mod4

// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 

outreg2 [mod4] using "Nouveaux_coeff.xls", ctitle("Nouveau modèle") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p))  addtext(Cragg-Uhler/Nagelkerke, 0.201, Correct prediction rate, 68.37% , Area under ROC curve, 0.7293, Hosmer–Lemeshow test, 0.3018 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) append

restore




 

 
 * 7. Faire une estimation séparée (ensemble, urbain, rural) et présenter dans un même graphique les résultats des odds ratio.
 
 
logit vaccination $explicatives, robust or

eststo OR

// les tests de validation
fitstat
estat classification
lroc // courbe de ROC 
estat gof

outreg2 [OR] using "Part_A_milieu.xls", eform ctitle("Ensemble") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p))  addtext(Cragg-Uhler/Nagelkerke, 0.199, Correct prediction rate, 66.58% , Area under ROC curve, 0.7269, Hosmer–Lemeshow test, 0.3671 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) replace




logit vaccination $explicatives if URBRUR==1, robust or
eststo OR1 

// les tests de validation
fitstat
estat classification
lroc // courbe de ROC 
estat gof


outreg2 [OR1] using "Part_A_milieu.xls", eform ctitle("Urbain") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.198, Correct prediction rate, 66.20% , Area under ROC curve, 0.7270, Hosmer–Lemeshow test, 0.2071 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) append


logit vaccination $explicatives if URBRUR==2, robust or

eststo OR2 

// les tests de validation
fitstat
estat classification
lroc // courbe de ROC 
estat gof

outreg2 [OR2] using "Part_A_milieu.xls", eform ctitle("Rural") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.203, Correct prediction rate, 68.35% , Area under ROC curve, 0.7317, Hosmer–Lemeshow test, 0.3923 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) append
 
 
 
 *8. Y a-t-il une variable susceptible d'être endogène au modèle ? Si oui, quelle solution vous proposez ? (maximum 5 lignes)
 



 
** Milieu
 
logit URBRUR i.info_radio i.lutte_covid i.gestion_gouver i.confiance i.education i.class_age i.sexe  

* Pas d'endogénéité des variables
 

**{B. Cette partie s'appuie sur la base de données «       base_estimation_enfants.dta»
***}


use "base_estimation_enfants.dta", clear

* 1 Estimer séparément l'effet de la variable « literacy » sur les indicateurs de santé infantile. 


logit stunted_growth i.literacy, robust 

eststo mod5

// les tests de validation
fitstat
estat classification
lroc // courbe de ROC 
estat gof 
ereturn list


outreg2 [mod5] using "Part1_B_Coeff.xls", ctitle("stunted_growth") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.008, Correct prediction rate, 79.96% , Area under ROC curve, 0.5387, Hosmer–Lemeshow test, . ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) replace



* Le retard de croissance à tendance à diminuer plus on est alphabète contrairement. 


logit Underweight i.literacy, robust 

eststo mod6

// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 
ereturn list

outreg2 [mod6] using "Part1_B_Coeff.xls", ctitle("Underweight") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.009, Correct prediction rate, 83.61% , Area under ROC curve, 0.5429, Hosmer–Lemeshow test, . ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3)  append

* Le fait d'être alphabète diminuent les chances d'être en insuffisance de poids contrairement aux analphabètes. 


logit emaciation i.literacy, robust 

eststo mod7

// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 
ereturn list

outreg2 [mod7] using "Part1_B_Coeff.xls", ctitle("emaciation") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.002, Correct prediction rate, 90.70% , Area under ROC curve, 0.5429, Hosmer–Lemeshow test, . ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3)  append

* L'aphabétisation réduit les chances d'être émaciés



**********************Les variables de contrôle pour affiner vos résultats**********

*  insurance marital_status service_acc_distance number_children wealth_index  water_source_imporved residential_zone


tab educ_level_partner
tab stunted_growth
tab Underweight
tab emaciation

* On remarque un déséquilibre au niveau de la proportion des variables dependantes 

* Nous procedons à un réechantillonnage équilibré de telle sorte que la proportion que nous ciblons soit  reprensentée à hauteur 30% 

* stunted_growth :: taille de l'échantillon ;  si  n1 = 1011 ----> 35% alors n0 ?  ----> 65%?
display 1011*0.65/0.35


preserve

sample 1877 if stunted_growth == 0, count

logit stunted_growth i.literacy  insurance marital_status service_acc_distance number_children  i.wealth_index water_source_imporved i.residential_zone, robust

eststo mod8


// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 


outreg2 [mod8] using "B_result.xls", ctitle("stunted_growth") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.076, Correct prediction rate, 65.27% , Area under ROC curve, 0.6394, Hosmer–Lemeshow test, 0.3030 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3) append

restore

preserve

* Underweight :: taille de l'échantillon ;  si  n1 = 827 ----> 35% alors n0 ?  ----> 65%?
display 827*0.65/0.35


sample 1535 if Underweight == 0, count

logit Underweight i.literacy  insurance marital_status service_acc_distance number_children  i.wealth_index water_source_imporved i.residential_zone, robust

eststo mod9


// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 


outreg2 [mod9] using "B_result.xls", ctitle("Underweight") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.062, Correct prediction rate, 64.94% , Area under ROC curve, 0.6254, Hosmer–Lemeshow test, 0.4979 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3)  append

restore


preserve

* emaciation :: taille de l'échantillon ;  si  n1 = 469 ----> 40% alors n0 ?  ----> 60%?
display 469*0.60/0.40


sample 703 if emaciation == 0, count

logit emaciation i.literacy  insurance marital_status service_acc_distance number_children  i.wealth_index water_source_imporved i.residential_zone, robust

eststo mod10

tab residential_zone

// les tests de validation

fitstat
estat classification
lroc // courbe de ROC 
estat gof 


outreg2 [mod10] using "B_result.xls", ctitle("emaciation") aster label addstat(R2 McFadden, e(r2_p),wald chi2, `e(chi2)', prob>chi2, e(p)) addtext(Cragg-Uhler/Nagelkerke, 0.034, Correct prediction rate, 60.49% , Area under ROC curve, 0.5908, Hosmer–Lemeshow test, 0.1349 ) addnote(Source : Calcul de l'auteur à partir des données d'Afrobaromètre, Round 9)   nocon nor2 excel dec(3)  append

restore

* 2 Existe -t-il un lien entre les variables dépendantes ? Si oui, quel type de modèle permet de prendre en compte cela ? Estimer l'effet de la variable « literacy » sur la santé infantile dans le cadre d'un modèle qui prend en compte l'interdépendance potentielle entre les variables dépendantes. (maximum 5 lignes)



foreach x of varlist stunted_growth Underweight{
	tabout `x' emaciation using "B_var_depend.xls", append c(freq col)  dpcomma h3("Tableau`x'") stats(chi2)
}

// On conclut donc qu'il y a une liaison entre les variables car la p-value est inférieure au seul de 5%. Le modèle qui permet de prendre en compte cela est la regression multiple multivariée. Car il permet de modéliser avec plusieurs variables dépendantes. 
 
 
 
*************** 	  	   ******************
************  	  Partie 2  	*************
***************				*****************


use "base_contrat.dta", clear



*Cette partie s'appuie sur la base de données « base_contrat.dta »

*1. On s'intéresse à la nature du contrat des travailleurs captée par la variable « type_contrat ». Sous quelles conditions, il est possible de modéliser cette variable. (maximum 5 lignes)



* 2. Faire un tableau synthétique des différentes variables que vous jugez pertinentes. Commenter (maximum 5 lignes).


 ************** Recodage de la variable b4 ********************
 
 *Definir un label pour la variable
gen sit_matr=.
replace sit_matr=1 if b4<=5 
replace sit_matr=2 if b4==6
recode sit_matr (.=3)


* Definir les classe age
label define lab_sit 1 "Marié" 2"Célibataire" 3"Divorcé/veuf"

*Appliquer les labels pour les deux variables creer
label values sit_matr lab_sit

*Tabuler la variable
tab type_contrat



 

foreach x of varlist b2 b3 sit_matr milieu nivinst malade{
	tabout `x' type_contrat using "Part2_var_expl.xls", append c(freq col)  dpcomma h3("Tableau`x'") stats(chi2)
}

tab type_contrat, nolab

*3. Estimer et présenter le modèle logit multinomial en fixant comme modalité de référence « CDI ». Commenter (maximum 10 lignes)

mlogit type_contrat i.b2 b3 i.sit_matr i.milieu i.nivinst i.malade,vce(robust) baseoutcome(1)



eststo mod12

outreg2 [mod12] using "Part2_Coeff.xls", ctitle(" (1)") aster label addstat(Pseudo R2, e(r2_p), Observations, e(N)) nocon nor2  excel dec(3) noobs replace

mlogtest, wald

*4. Estimer et présenter dans un tableau les risques relatifs.


mlogit type_contrat i.b2 b3 i.sit_matr i.milieu i.nivinst i.malade,vce(robust) baseoutcome(1) rrr

outreg2  using "Part2_Risk.xls", ctitle(" (1)") aster label addstat(Pseudo R2, e(r2_p), Observations, e(N)) nocon nor2 excel dec(3) noobs replace

tab b2, nolab



* 5. Estimer et présenter dans un tableau les effets marginaux. 

* Transformation des variables catégorielles en bianire.

foreach x of varlist b2 sit_matr milieu nivinst malade{
	tab `x', gen(`x')
}

mlogit type_contrat b22 b3 sit_matr2 sit_matr3 milieu2 nivinst2 nivinst3 nivinst4 nivinst5 malade2,vce(robust) baseoutcome(1) 


forvalues x=1/4{
mfx compute , predict(outcome(`x'))
outreg2 using "Part2_effet_marginal.xls", mfx ctitle(effet marginaux y=`x')
}


* 6) L'hypothèse de IIA

clonevar type_contrat_ = type_contrat
label define type_contrat_label 1" CDI" 2"CDD" 3 "CPS" 4"Sans contrat"
label values type_contrat_ type_contrat_label

 
mlogit type_contrat_ i.b2 b3 i.sit_matr i.milieu i.nivinst i.malade, baseoutcome(1) 

mlogtest, iia 
mlogtest, all 
mlogtest, wald

* L'hypotèse IIA n'est donc pas vérifiée. Ainsi, on peut conclure que la probabilité qu'un individu prenne un caractère n'est pas indépendante d'un autre. Elle a tendance à varier et donc être peu fiable. Ainsi, le modèle multinomial n'est donc pas commode pour cette étude.  












************** 		       **************
************     PARTIE 3      **********
**************		       **************



use "base_labor_market_estimation.dta", clear


**Cette partie s'appuie sur la base de données « base_labor_market_estimation.dta»****



**1. On s'intéresse à identifier les déterminants de la rémunération captée par la variable « revenu » dans la base de données. Quel problème de modélisation soulève cette variable ? (maximum 5 lignes)





**2. Faire un tableau synthétique des différentes variables que vous jugez pertinentes pour le problème posé. Commenter (maximum 10 lignes).

gen annee_exp = year_exp
replace annee_exp = 0 if year_exp ==.

foreach x of varlist sexe nbr_enfant annee_exp nbr_year_educ milieu niv_educ region  {
	tab `x'
}


br year_exp  annee_exp 
*revenu labor_part if labor_part==0

**3. Estimer un modèle linéaire sur l'ensemble de l'échantillon puis dans le sous-échantillon des travailleurs.. Faire un tableau comparatif des résultats. Que constatez-vous ? (maximum 5 lignes)

* Estimation du modele lineaire sur l'ensemble de l'echantillon
replace ln_wage = 0  if ln_wage==.

br ln_wage
// Nous utilisons le log du revenu 

regress ln_wage i.sexe age nbr_enfant  dependance   annee_exp i.milieu i.region, robust

outreg2 using "Part3_coeff.xls", ctitle("Coeff")  aster label addstat(Pseaudo R2, e(r2), Observations, e(N)) nocon nor2  excel dec(3) noobs replace
 
* Estimation du modele lineaire sur l'echantillon des travailleurs 
regress ln_wage i.sexe age nbr_enfant  dependance   annee_exp i.milieu i.region if labor_part==1 , robust


outreg2 using "Part3_coeff.xls", ctitle("Coeff")  aster label addstat(Pseaudo R2, e(r2), Observations, e(N)) nocon nor2  excel dec(3) noobs append 


** Prédire les revenus pour les non travailleurs

regress ln_wage i.sexe age nbr_enfant  dependance   annee_exp i.milieu i.region, robust

predict regress_pred, xb

br regress_pred ln_wage labor_part



*4. Estimer un modèle de sélection de Heckman avec les mêmes variables.

*probit labor_part health_problem age i.dependance i.stat_matrim i.avoir_enfant

*summarize
//predict z, xb  

*predict z if e(sample), xb

*gen PHI=normal(z)
*gen phi=normalden(z)
*gen lambda=phi/PHI

*regress ln_wage lambda i.sexe  nbr_enfant  annee_exp nbr_year_educ  i.milieu i.niv_educ i.region , robust


heckman ln_wage i.sexe age nbr_enfant  dependance   annee_exp i.milieu i.region, select(labor_part =  nbr_year_educ niv_educ health_problem   avoir_enfant) twostep

outreg2 using "Part3_heckman.xls", ctitle("Coeff")  aster label replace 


*. Prédire les revenus pour les non travailleurs 
predict  heckman_predict, xb


replace ln_wage = heckman_predict  if labor_part==0 // Le revenu predict si la personne ne travaille pas

br ln_wage 

* Comparer les résultats des prédictions avec ceux de la question 3


br ln_wage heckman_predict regress_pred


// Le coefficient de l'inverse de Mills est significatif, alors, la base présente un biais de sélection; par suite, il est préférable de modéliser le phénomène à partie de la base avec le modèle Hecman à deux étapes. On peut donc dire que le modèle de regression simple n'est pas approprié. 












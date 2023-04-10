## GLAAS Data for OLAS Platform

library(tidyverse)
library(readxl)
library(plyr)
a_ <- read_excel("glaas_2021_22_full_country_dataset.xlsx", sheet = "Section A Data",skip = 4)

variable_list <- a_[2,]
variable_list_2<-pivot_longer(variable_list,1:length(variable_list))
# names<-names(a_lac)
# new_names <- names(a_lac)
# for(i in 1:length(names)){
#   new_names[i]<-paste0(names[i],".  ",a_lac[2,i] )
#   
# }
#colnames(a_lac)<- new_names

a_lac <- a_[a_$`SDG_region` == "Latin America and the Caribbean",]

table(a_lac$`A1_a_1`)

table(a_lac$`A1_a_2`)

table(a_lac$`A1_b_1`)

table(a_lac$`A1_b_2`)


#Concatenate policy and year for A2

a_lac$A2_a_1_urb<-paste0(a_lac$`A2_a_i_1`," ",a_lac$`A2_a_ii_1`)

a_lac$A2_a_2_rur<-paste0(a_lac$`A2_a_i_2`," ",a_lac$`A2_a_ii_2`)


a_lac$A2_d_iii_wwt<-paste0(a_lac$`A2_d_iii_2`," ",a_lac$`A2_d_iii_3`)



glaas_2021<-select(a_lac,
                   ISO_3,
                   Location,
                   `A1_a_1`, # Does constitution or legislation recognize drinking water as a human right?
                   `A1_a_2`, # Does constitution or legislation recognize sanitation as a human right?
                   #`A1_b_1.  doesn't exist
                   #`A1_b_2.  doesn't exist
                   `A1_a_i_1`, # right to water year
                   `A1_a_i_2`, # right sanitation year
                   
                   #`A1_c_1.  Has the court recognized human rights to water in its decisions?`, doesnt exist in 2022
                   #`A1_c_2.  Has the court recognized human rights to sanitation in its decisions?`, doesnt exist in 2022
                   
                   
                  #NONE of the following are in the 2022
                   #`A2.  Does your country have a national development plan?`,
                   #`A2_c.  If yes, does the national development plan address drinking-water?`,
                   #`A2_d.  If yes, does the national development plan address sanitation?`,
                   ## water quality
                  
                  `A2_a_1`, # Urban standards
                  `A2_a_2`, # Rural drinking water quality standards
                  #`A3_a_i.  If yes, name and year of most recent drinking-water quality standards.`,
                  `A2_a_1_urb`, # concat year and leg
                  `A2_a_2_rur`, # concat year and leg
                  
                  `A2_b_1`, # Urban drinking water service standards 
                  `A2_b_2`, # Rural drinking water service standards
                  
                
    
                  # None of the following are in 2022
                  # `A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?`,
                  # `A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?`,
                   
                  # `A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?`,
                  # `A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?`,
                   ## Sanitation 
                   `A2_d_i_1`, # Are formal national sanitation and wastewater treatment standards in place for onsite sanitation?`,
                   `A2_d_ii_1`, # Are formal national sanitation and wastewater treatment standards in place for faecal sludge?`,
                   `A2_d_iii_1`, #A3_e_3.  Are formal national sanitation and wastewater treatment standards in place for wastewater?`,
                   `A2_d_iv_1`,#  Are formal national sanitation and wastewater treatment standards in place for onsite safe re-use?`,
                  
                  # `A3_f.  Are wastewater surveillance requirements defined in formal instruments?`,
                  `A2_d_iii_wwt`, #`A3_e_i.  If yes, name and year of sanitation and wastewater treatment standards.`,
                  `A2_f_i_1`,	#National standards or guidelines for WASH in health care facilities                                  
                  
                  `A3_e_1`, # Climate change preparedness approaches for WASH used in national planning
                  `A4_e_1`,	#Implementation of climate change preparedness approaches for local-level risk assessment and management of WASH NEW
                  
                  
                  
                  
                   # Schools
                  `A5_I_i`, #`A5_VI_b_i. Is WASH in schools included in any national policy or plan?`,
                   
                   ## Policy status
                  `A5_I_a`, #`A5_I_a. Policy status - urban sanitation`,
                  `A5_I_b`,	# Urban sanitation plan/strategy status             
                  
                  
                  `A5_I_c`, #`A5_II_a. Policy status - rural sanitation`,
                  `A5_I_d`, #	Rural sanitation plan/strategy status             
                  `A5_I_e`, #`A5_III_a. Policy status - urban drinking-water`,
                  `A5_I_f`,	#Urban drinking-water plan/strategy status          
                  
                  `A5_I_g`, #`A5_IV_a. Policy status - rural drinking-water`,
                  `A5_I_h`, #	Rural drinking-water plan/strategy status         
                  
                  `A5_I_i`,#	WASH in schools policy status                       
                  `A5_I_j`,#	WASH in schools plan/strategy status                
                  
                  `A5_I_k`,#A5 WASH in health care facilities policy status,
                  `A5_I_l`, #	WASH in health care facilities plan/strategy status  
                  
                  ########### ALL NEW ###############
                  `A5_II_a_1`,  #Policy/plans address affordability measures for drinking-water
                  `A5_II_a_4`,	#Urban drinking-water policy/plan addresses affordability measures for drinking-water
                  `A5_II_a_5`,	#Rural drinking-water policy/plan addresses affordability measures  for drinking-water
                  
                  `A5_II_b_1`,	#Policy/plans address access to safely managed drinking-water supply
                  `A5_II_c_1`,	#Policy/plans address household connections for drinking-water
                  `A5_II_e_1`,	#Policy/plans address Affordability measures for sanitation
                  
                  `A5_II_e_2`,	#Urban sanitation policy/plan addresses affordability measures for sanitation
                  `A5_II_e_3`,	#Rural sanitation policy/plan addresses affordability measures for sanitation
                  
                  `A5_II_i_1`,	#Policy/plans address Safe use of treated municipal wastewater and municipal faecal sludge

                  `A5_II_k_1`,	#Policy/plans address Hand hygiene facilities

                  
                  `A5_II_n_1`,	#Policy/plans address Risks of climate variability and climate change to WASH services
                  
                  ####### ABOVE ALL NEW ###########
                  
                   ## Lead ministry This is kind of in 2022 but need to look at how to implement it???
                  # `A6_a_i. Lead ministry for setting targets - sanitation`,
                  # `A6_a_ii. Lead ministry for setting targets - drinking-water`,
                  # `A6_a_iii. Lead ministry for setting targets - hygiene`,
                   
                   # progress on national targets
                  
                  `A10_a`, # `A12.  Mechanism  to coordinate work of different ministries`
                  `A10_a_i`, # What is the name of the coordination mechanism                             
                  `A10_a_ii`, # Which government institution/ ministry or stakeholder leads the mechanism 
                  
                  
                  `A7_I_a_i_1`, #Target value - National sanitation
                  `A7_I_a_i_2`, #Target year - National sanitation
                  `A7_II_a_i_1`, #Target Value - National drinking-water
                  `A7_II_a_i_2`, #Target Year - National drinking-water
                  `A7_I_d_ii_1`, #Report the baseline and most recent coverage data for the sanitation targets - Latest Value - National
                  `A7_I_d_ii_2`, #Report the baseline and most recent coverage data for the sanitation targets - Latest Year - National
                  `A7_II_d_ii_1`, #Report the baseline and most recent coverage data for the drinking-water targets - Latest Value - National
                  `A7_II_d_ii_2` #Report the baseline and most recent coverage data for the drinking-water targets - Latest Year - National
                   
                   
)





glaas_2021_22<-dplyr::rename(glaas_2021,
                      "ISO3" = "ISO_3",
                      "Country" ="Location",
                      
                      
                      "A1 Drinking water as a human right recognized legally" ="A1_a_1",
                      "A1 Drinking water as a human right recognized year" ="A1_a_i_1",    
                      "A1 Sanitation as a human right recognized legally"="A1_a_2", # New in 2022
                      "A1 Sanitation as a human right recognized year" ="A1_a_i_2", # New in 2022

              ## water standards
                      "A3 Has urban national drinking-water quality standards"= "A2_a_1",
                      "A3 Has rural national drinking-water quality standards" = "A2_a_2", #"A3_a_2.  Are formal national drinking-water quality standards or equivalent in place - rural?",
                      "A3 Name and year of drinking-water quality standards - urban" = "A2_a_1_urb",
                      "A3 Name and year of drinking-water quality standards - rural" = "A2_a_2_rur",
                      "A3 Has urban drinking water service standards" = "A2_b_1",
                      "A3 Has rural drinking water service standards" = "A2_b_2",
                      "A3 National standards or guidelines for WASH in health care facilities " =`A2_f_i_1`,	# doesnt exist in 2018
              

                      ## Sanitation standards 
                      "A3 WWT standards for onsite sanitation"="A2_d_i_1",
                      "A3 WWT standards for faecal sludge"= "A2_d_ii_1",
                      "A3 WWT standards for wastewater"= "A2_d_iii_1",
                      "A3 WWT standards for safe reuse"= "A2_d_iv_1",


                      "A3 Name and year of sanitation and WWT standards"= "A2_d_iii_wwt",
                      "A3 National planning incorporates climate change preparedness approaches for WASH" ="A3_e_1", # Missing in 2018
                      
                      ## Policy status
                      "A5 Policy status - urban sanitation" = "A5_I_a",
                      "A5 Implementation plan status - urban sanitation" = `A5_I_b` ,                    
                      "A5 Policy status - rural sanitation" ="A5_I_c",
                      "A5 Implementation plan status - rural sanitation" = `A5_I_d`,
                      "A5 Policy status - urban drinking-water" ="A5_I_e",
                      "A5 Implementation plan status - urban drinking-water" =`A5_I_f`,
                      "A5 Policy status - rural drinking-water" = "A5_I_g",
                      "A5 Implementation plan status - rural drinking-water" =`A5_I_h`,
              
                      "A5 Policy status - WASH in schools" = `A5_I_i`,
                      "A5 Implementation plan status - WASH in schools" = `A5_I_j`,
                      "A5 WASH in health care facilities policy status"="A5_I_k",
                      "A5 Implementation plan status - WASH in health care facilities" = `A5_I_l`,

                      "A5 Policy/plans address affordability measures for drinking-water" =  `A5_II_a_1`,  
                      "A5 Urban drinking-water policy/plan addresses affordability measures for drinking-water" =`A5_II_a_4`,	
                      "A5 Rural drinking-water policy/plan addresses affordability measures  for drinking-water" =  `A5_II_a_5`,	
              
                      "A5 Policy/plans address access to safely managed drinking-water supply"= `A5_II_b_1`,	
                      "A5 Policy/plans address household connections for drinking-water"= `A5_II_c_1`,	
                      "A5 Policy/plans address Affordability measures for sanitation" =`A5_II_e_1`,
                      "A5 Urban sanitation policy/plan addresses affordability measures for sanitation"  =`A5_II_e_2`,
                      "A5 Rural sanitation policy/plan addresses affordability measures for sanitation"  =`A5_II_e_3`,	
              
                      "A5 Policy/plans address Safe use of treated municipal wastewater and municipal faecal sludge" = `A5_II_i_1`,
                      "A5 Policy/plans address Hand hygiene facilities" = `A5_II_k_1`,
                      "A5 Policy/plans address Risks of climate variability and climate change to WASH services" =`A5_II_n_1`,
              
                      # progress on national targets
                      
                      "A12 Mechanisms to coordinate ministries" ="A10_a",
                      "A12 Name of formal coordination mechanism" =  `A10_a_i`,
                      "A12 Stakeholder that leads mechanism" = "A10_a_ii",   
                      
                        "A7 Target value - National sanitation" = "A7_I_a_i_1", #new
                        "A7 Target year - National sanitation"  = "A7_I_a_i_2", #new
                        "A7 Target Value - National drinking-water"= "A7_II_a_i_1", #new
                        "A7 Target Year - National drinking-water"="A7_II_a_i_2", #new
                        "A7 Latest value for the sanitation targets - National"="A7_I_d_ii_1", #new
                        "A7 Latest value for the sanitation targets - National - year" ="A7_I_d_ii_2", 
                        "A7 Latest value for the drinking-water targets - National"="A7_II_d_ii_1", #Report the baseline and most recent coverage data for the drinking-water targets - Latest Value - National
                        "A7 Latest value for the drinking-water targets - National - year"=  "A7_II_d_ii_2" #Report the baseline and most recent coverage data for the drinking-water targets - Latest Year - National
              
              
)



# Not in 2022     "A1 Court recognized human rights to water"  = "A1_c_1.  Has the court recognized human rights to water in its decisions?",
# Not in 2022     "A1 Court recognized human right to sanitation" = "A1_c_2.  Has the court recognized human rights to sanitation in its decisions?",
# Not in 2022     "A2 Has National Development Plan" = "A2.  Does your country have a national development plan?",
# Not in 2022     "A2 NDP addresses drinking water" ="A2_c.  If yes, does the national development plan address drinking-water?",
# Not in 2022     "A2 NDP addresses sanitation" ="A2_d.  If yes, does the national development plan address sanitation?",
#"A3 Drinking-water surveillance requirements - urban" = "A3_b_1.  Are drinking-water quality surveillance requirements defined informal instruments - urban?",
#"A3 Drinking-water surveillance requirements - rural" ="A3_b_2.  Are drinking-water quality surveillance requirements defined informal instruments - rural?",
#"A3 Name and year of surveillance requirements" = "A3_b_i.  If yes, name and year of most recent instruments on surveillance requirements.",
#"A3 Roles and responsibilities to ensure urban drinking-water safety formally defined"="A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?",
#"A3 Roles and responsibilities to ensure rural drinking-water safety formally defined"="A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?",
#"A3 WW surveillance requirements formally defined"= "A3_f.  Are wastewater surveillance requirements defined in formal instruments?",
## Lead ministry
#   "A6 Lead ministry - sanitation" = "A6_a_i. Lead ministry for setting targets - sanitation",
#   "A6 Lead ministry - drinking-water" = "A6_a_ii. Lead ministry for setting targets - drinking-water",
#   "A6 Lead ministry - hygiene" =  "A6_a_iii. Lead ministry for setting targets - hygiene",

glaas_2021_22$survey_cycle <-2021

write.csv(glaas_2021_22, "glaas_2021.csv", row.names = FALSE )




glaas_2018_2022<-rbind.fill(glaas_2018_19, glaas_2021_22)

glaas_2018_2022$`A1 Drinking water as a human right recognized date`<-glaas_2018_2022$`A1 Drinking water as a human right recognized year`
glaas_2018_2022$`A1 Drinking water as a human right recognized year`<-as.numeric(str_extract(string = glaas_2018_2022$`A1 Drinking water as a human right recognized date`, pattern ="\\b\\d{4}\\b")) 

glaas_2018_2022$`A1 Sanitation as a human right recognized date` <-glaas_2018_2022$`A1 Sanitation as a human right recognized year`
glaas_2018_2022$`A1 Sanitation as a human right recognized year`<-as.numeric(str_extract(string = glaas_2018_2022$`A1 Sanitation as a human right recognized date`, pattern ="\\b\\d{4}\\b")) 


View(select(glaas_2018_2022, ISO3, `A1 Drinking water as a human right recognized date`, `A1 Drinking water as a human right recognized year`,`A1 Sanitation as a human right recognized date`,`A1 Sanitation as a human right recognized year`))
class(glaas_2018_2022$`A1 Drinking water as a human right recognized year`)



glaas_2018_2022 <-glaas_2018_2022[!is.na(glaas_2018_2022$ISO3),]

write.csv(glaas_2018_2022, "glaas_2018_2022.csv", row.names = FALSE,fileEncoding ="UTF-8") #"latin1" "iso-8859-1"


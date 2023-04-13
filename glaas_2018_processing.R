## GLAAS Data for OLAS Platform
rm(list = ls())
library(tidyverse)

library(readxl)
a_ <- read_excel("inputs/glaas_2018_19_full_country_dataset_july-2021.xlsx", sheet = "Section A Data",skip = 7)
a_lac <- a_[a_$`SDG Region` == "Latin America and the Caribbean",]

table(a_lac$`A1_a_1.  Does the constitution  recognize drinking-water as a human right?`)

table(a_lac$`A1_a_2.  Does the constitution  recognize sanitation as a human right?`)

table(a_lac$`A1_b_1.  Does other legislation recognize drinking-water as a human right?`)

table(a_lac$`A1_b_2.  Does other legislation  recognize sanitation as a human right?`)


glaas_2019<-select(a_lac,
              ISO3,
              Country,
              `A1_a_1.  Does the constitution  recognize drinking-water as a human right?`,
              `A1_a_2.  Does the constitution  recognize sanitation as a human right?`,
              `A1_b_1.  Does other legislation recognize drinking-water as a human right?`,
              `A1_b_2.  Does other legislation  recognize sanitation as a human right?`,
              `A1_a_i_1.  If yes, please provide date that such recognition in the constitution occurred (month and year).`,
              `A1_b_i_1.  If yes, please provide date that such recognition in other legislation occurred (month and year).`,
              `A1_a_i_2.  If yes, please provide date that such recognition in the constitution occurred (month and year).`,
              `A1_b_i_2.  If yes, please provide date that such recognition in other legislation occurred (month and year).`,
            


              `A1_c_1.  Has the court recognized human rights to water in its decisions?`,
              `A1_c_2.  Has the court recognized human rights to sanitation in its decisions?`,
              `A2.  Does your country have a national development plan?`,
              `A2_c.  If yes, does the national development plan address drinking-water?`,
              `A2_d.  If yes, does the national development plan address sanitation?`,
              ## water quality
              `A3_a_1.  Are formal national drinking-water quality standards or equivalent in place - urban?`,
              `A3_a_2.  Are formal national drinking-water quality standards or equivalent in place - rural?`,
              `A3_a_i.  If yes, name and year of most recent drinking-water quality standards.`,
              
              `A3_b_1.  Are drinking-water quality surveillance requirements defined informal instruments - urban?`,
              `A3_b_2.  Are drinking-water quality surveillance requirements defined informal instruments - rural?`,
              `A3_b_i.  If yes, name and year of most recent instruments on surveillance requirements.`,
              
              `A3_d_1.  Besides drinking-water quality, are formal national regulations or standards in place for drinking-water service delivery requirements - urban?`, # NEW
              `A3_d_2.  Besides drinking-water quality, are formal national regulations or standards in place for drinking-water service delivery requirements - rural?`, # NEW
              `A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?`,
              `A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?`,

              ## Sanitation 
              `A3_e_1.  Are formal national sanitation and wastewater treatment standards in place for onsite sanitation?`,
              `A3_e_2.  Are formal national sanitation and wastewater treatment standards in place for faecal sludge?`,
              `A3_e_3.  Are formal national sanitation and wastewater treatment standards in place for wastewater?`,
              `A3_e_4.  Are formal national sanitation and wastewater treatment standards in place for onsite safe re-use?`,
              `A3_f.  Are wastewater surveillance requirements defined in formal instruments?`,
              `A3_e_i.  If yes, name and year of sanitation and wastewater treatment standards.`,
              # Schools
              `A5_VI_b_i. Is WASH in schools included in any national policy or plan?`,
             
              ## Policy status
              `A5_I_a. Policy status - urban sanitation`,
              `A5_I_b. Implementation plan status - urban sanitation`,
              `A5_II_a. Policy status - rural sanitation`,
              `A5_II_b. Implementation plan status - rural sanitation`,
              `A5_III_a. Policy status - urban drinking-water`,
              `A5_III_b. Implementation plan status - urban drinking-water`,
              `A5_IV_a. Policy status - rural drinking-water`,
              `A5_IV_b. Implementation plan status - rural drinking-water`,
              
              
              
              
              ## Lead ministry
              `A6_a_i. Lead ministry for setting targets - sanitation`,
              `A6_a_ii. Lead ministry for setting targets - drinking-water`,
              `A6_a_iii. Lead ministry for setting targets - hygiene`,
              
              # progress on national targets
              
              `A12.  Mechanism  to coordinate work of different ministries`,
              `A12_j. Name of formal mechanism`
)






## added
glaas_2019$`a1_leg_dw Drinking water as a human right recognized legally`<- ifelse(glaas_2019$`A1_a_1.  Does the constitution  recognize drinking-water as a human right?`== 1|
                                glaas_2019$`A1_b_1.  Does other legislation recognize drinking-water as a human right?`==1,1,0)


glaas_2019$`a1_leg_san Sanitation as a human right recognized legally` <- ifelse(glaas_2019$`A1_a_2.  Does the constitution  recognize sanitation as a human right?`== 1|
                                 glaas_2019$`A1_b_2.  Does other legislation  recognize sanitation as a human right?`==1,1,0)


glaas_2019$`A1_a_i_1_year` <- ifelse(is.na(glaas_2019$`A1_a_i_1.  If yes, please provide date that such recognition in the constitution occurred (month and year).`),glaas_2019$`A1_b_i_1.  If yes, please provide date that such recognition in other legislation occurred (month and year).`,glaas_2019$`A1_a_i_1.  If yes, please provide date that such recognition in the constitution occurred (month and year).`)
glaas_2019$`A1_a_i_2_year` <- ifelse(is.na(glaas_2019$`A1_a_i_2.  If yes, please provide date that such recognition in the constitution occurred (month and year).`),glaas_2019$`A1_b_i_2.  If yes, please provide date that such recognition in other legislation occurred (month and year).`,glaas_2019$`A1_a_i_2.  If yes, please provide date that such recognition in the constitution occurred (month and year).`)


glaas_2019 = subset(glaas_2019, select = -c(`A1_a_1.  Does the constitution  recognize drinking-water as a human right?`,`A1_a_2.  Does the constitution  recognize sanitation as a human right?`,`A1_b_1.  Does other legislation recognize drinking-water as a human right?`, `A1_b_2.  Does other legislation  recognize sanitation as a human right?`,              `A1_a_i_1.  If yes, please provide date that such recognition in the constitution occurred (month and year).`,
                                            `A1_b_i_1.  If yes, please provide date that such recognition in other legislation occurred (month and year).`,
                                            `A1_a_i_2.  If yes, please provide date that such recognition in the constitution occurred (month and year).`,
                                            `A1_b_i_2.  If yes, please provide date that such recognition in other legislation occurred (month and year).`))




glaas_2018_19<-dplyr::rename(glaas_2019,
                  "A1 Drinking water as a human right recognized legally" ="a1_leg_dw Drinking water as a human right recognized legally",
                  "A1 Sanitation as a human right recognized legally"="a1_leg_san Sanitation as a human right recognized legally",
                  "A1 Court recognized human rights to water"  = "A1_c_1.  Has the court recognized human rights to water in its decisions?",
                  "A1 Court recognized human right to sanitation" = "A1_c_2.  Has the court recognized human rights to sanitation in its decisions?",
                  "A1 Drinking water as a human right recognized year" = "A1_a_i_1_year",
                  "A1 Sanitation as a human right recognized year" ="A1_a_i_2_year",
                
                  "A2 Has National Development Plan" = "A2.  Does your country have a national development plan?",
                  "A2 NDP addresses drinking water" ="A2_c.  If yes, does the national development plan address drinking-water?",
                  "A2 NDP addresses sanitation" ="A2_d.  If yes, does the national development plan address sanitation?",
             ## water quality
                   "A3 Has urban national drinking-water quality standards"= "A3_a_1.  Are formal national drinking-water quality standards or equivalent in place - urban?",
                   "A3 Has rural national drinking-water quality standards" = "A3_a_2.  Are formal national drinking-water quality standards or equivalent in place - rural?",
                   "A3 Name and year of drinking-water quality standards - urban" = "A3_a_i.  If yes, name and year of most recent drinking-water quality standards.",
                   "A3 Name and year of drinking-water quality standards - rural" = "A3_a_i.  If yes, name and year of most recent drinking-water quality standards.",
                   "A3 Has urban drinking water service standards" = "A3_d_1.  Besides drinking-water quality, are formal national regulations or standards in place for drinking-water service delivery requirements - urban?",
                   "A3 Has rural drinking water service standards" = "A3_d_2.  Besides drinking-water quality, are formal national regulations or standards in place for drinking-water service delivery requirements - rural?",

             
             
                   "A3 Drinking-water surveillance requirements - urban" = "A3_b_1.  Are drinking-water quality surveillance requirements defined informal instruments - urban?",
                   "A3 Drinking-water surveillance requirements - rural" ="A3_b_2.  Are drinking-water quality surveillance requirements defined informal instruments - rural?",
                   "A3 Name and year of surveillance requirements" = "A3_b_i.  If yes, name and year of most recent instruments on surveillance requirements.",
                   
                   "A3 Roles and responsibilities to ensure urban drinking-water safety formally defined"="A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?",
                   "A3 Roles and responsibilities to ensure rural drinking-water safety formally defined"="A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?",

                   ## Sanitation 
                   "A3 WWT standards for onsite sanitation"="A3_e_1.  Are formal national sanitation and wastewater treatment standards in place for onsite sanitation?",
                   "A3 WWT standards for faecal sludge"= "A3_e_2.  Are formal national sanitation and wastewater treatment standards in place for faecal sludge?",
                   "A3 WWT standards for wastewater"= "A3_e_3.  Are formal national sanitation and wastewater treatment standards in place for wastewater?",
                   "A3 WWT standards for safe reuse"= "A3_e_4.  Are formal national sanitation and wastewater treatment standards in place for onsite safe re-use?",
                   "A3 WW surveillance requirements formally defined"= "A3_f.  Are wastewater surveillance requirements defined in formal instruments?",
                   "A3 Name and year of sanitation and WWT standards"= "A3_e_i.  If yes, name and year of sanitation and wastewater treatment standards.",
             
                   # Schools
                   "A5 Policy status - WASH in schools"="A5_VI_b_i. Is WASH in schools included in any national policy or plan?",
                   
                   ## Policy status
             
             
             ## Policy status

             `A5_IV_a. Policy status - rural drinking-water`,
             `A5_IV_b. Implementation plan status - rural drinking-water`,
             
             
                   "A5 Policy status - urban sanitation" = "A5_I_a. Policy status - urban sanitation",
                   "A5 Implementation plan status - urban sanitation" =`A5_I_b. Implementation plan status - urban sanitation`,
                   "A5 Policy status - rural sanitation" ="A5_II_a. Policy status - rural sanitation",
                   "A5 Implementation plan status - rural sanitation" = `A5_II_b. Implementation plan status - rural sanitation`,
                   "A5 Policy status - urban drinking-water" =`A5_III_a. Policy status - urban drinking-water`,
                   "A5 Implementation plan status - urban drinking-water" =  `A5_III_b. Implementation plan status - urban drinking-water`,
                   "A5 Policy status - rural drinking-water" = `A5_IV_a. Policy status - rural drinking-water`,
                   "A5 Implementation plan status - rural drinking-water"=`A5_IV_b. Implementation plan status - rural drinking-water`,
                   
                   ## Lead ministry
                   "A6 Lead ministry - sanitation" = "A6_a_i. Lead ministry for setting targets - sanitation",
                   "A6 Lead ministry - drinking-water" = "A6_a_ii. Lead ministry for setting targets - drinking-water",
                   "A6 Lead ministry - hygiene" =  "A6_a_iii. Lead ministry for setting targets - hygiene",
                   
                   # progress on national targets
                   
                   "A12 Mechanisms to coordinate ministries" ="A12.  Mechanism  to coordinate work of different ministries",
                   "A12 Name of formal coordination mechanism" =  `A12_j. Name of formal mechanism`
             
                   
                   
)







glaas_2018_19$survey_cycle <- 2018



#write.csv(glaas_2018_19, "outputs/glaas_2018_19.csv", row.names = FALSE )




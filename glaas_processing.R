## GLAAS Data for OLAS Platform

library(tidyverse)

library(readxl)
a_ <- read_excel("glaas_2018_19_full_country_dataset_july-2021.xlsx", sheet = "Section A Data",skip = 7)
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
              `A1_a_1.  Does the constitution  recognize drinking-water as a human right?`,
              `A1_b_1.  Does other legislation recognize drinking-water as a human right?`,
              `A1_a_2.  Does the constitution  recognize sanitation as a human right?`,
              `A1_a_2.  Does the constitution  recognize sanitation as a human right?`, 
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
              
              `A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?`,
              `A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?`,
              
              `A3_c_1.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - urban?`,
              `A3_c_2.  Are roles and responsibilities to ensure drinking-water safety defined in formal instruments - rural?`,
              ## Sanitation 
              `A3_e_1.  Are formal national sanitation and wastewater treatment standards in place for onsite sanitation?`,
              `A3_e_2.  Are formal national sanitation and wastewater treatment standards in place for faecal sludge?`,
              `A3_e_3.  Are formal national sanitation and wastewater treatment standards in place for wastewater?`,
              `A3_e_4.  Are formal national sanitation and wastewater treatment standards in place for onsite safe re-use?`,
              `A3_f.  Are wastewater surveillance requirements defined in formal instruments?`,
              
              ## Policy status
              `A5_I_a. Policy status - urban sanitation`,
              `A5_II_a. Policy status - rural sanitation`,
              `A5_III_a. Policy status - urban drinking-water`,
              `A5_IV_a. Policy status - rural drinking-water`,
              
              ## Lead ministry
              `A6_a_i. Lead ministry for setting targets - sanitation`,
              `A6_a_ii. Lead ministry for setting targets - drinking-water`,
              `A6_a_iii. Lead ministry for setting targets - hygiene`,
              
              # progress on national targets
              
              `A12.  Mechanism  to coordinate work of different ministries`
            

)

## added
glaas_2019$`a1_leg_dw Drinking water as a human right recognized legally`<- ifelse(glaas_2019$`A1_a_1.  Does the constitution  recognize drinking-water as a human right?`== 1|
                                glaas_2019$`A1_b_1.  Does other legislation recognize drinking-water as a human right?`==1,1,0)


glaas_2019$`a1_leg_san Sanitation as a human right recognized legally` <- ifelse(glaas_2019$`A1_a_2.  Does the constitution  recognize sanitation as a human right?`== 1|
                                 glaas_2019$`A1_b_2.  Does other legislation  recognize sanitation as a human right?`==1,1,0)





#pivot_longer(glass_2019, var )



write.csv(glaas_2019, "glaas_2019.csv", row.names = FALSE )






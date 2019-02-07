## MINDMAP
## make datasets
## JAN 2019

## source("../lib/get_area.R")

## ## Network properties
## study_network <- mindmap_studies %>%
##     select(id:acronym, collectedVariables,
##            dataSources.questionnaires:numberOfParticipants.participant.noLimit,
##            methods.designs:startYear) %>%
##     mutate(has_data = ifelse(collectedVariables == 0, "no", "yes"))
## cols <- c("dataSources.questionnaires", "dataSources.cognitive_measures",
##           "dataSources.physical_measures", "dataSources.biological_samples",
##           "dataSources.administratives_databases", "dataSources.others",
##           "numberOfParticipants.sample.noLimit",
##           "numberOfParticipants.participant.noLimit")
## study_network[, cols] <- lapply(study_network[, cols], as.numeric)
## study_network <- study_network %>%
##     mutate(study_size = ifelse(numberOfParticipants.participant.number < 1000,
##                                "small",
##                         ifelse(numberOfParticipants.participant.number >= 1000& numberOfParticipants.participant.number < 5000,
##                                "medium",
##                         ifelse(numberOfParticipants.participant.number >= 5000,
##                                "large", NA))),
##            bio_size = ifelse(numberOfParticipants.sample.number < 1000,
##                              "small",
##                       ifelse(numberOfParticipants.sample.number >= 1000 &
##                              numberOfParticipants.sample.number < 5000,
##                              "medium",
##                       ifelse(numberOfParticipants.sample.number >= 5000,
##                              "large", NA))),
##            study_size = ifelse(numberOfParticipants.participant.noLimit == 1,
##                                "no limit", study_size),
##            bio_size = ifelse(numberOfParticipants.sample.noLimit == 1,
##                              "no limit", bio_size),
##            bio_size = ifelse(is.na(bio_size), study_size, bio_size),
##            start = ifelse(startYear < 1960, "<1960",
##                    ifelse(startYear >= 1960 & startYear < 1980, "1960-1980",
##                    ifelse(startYear >= 1980 & startYear < 2000, "1980-2000",
##                           ">2000"))))

## ## Population
## ## Get countries
## mindmap_countries <- unlist(strsplit(mindmap_pop$selectionCriteria.countriesIso,
##                             split = '|', fixed = TRUE))
## mindmap_countries <- mindmap_pop %>%
##     select(studyId, selectionCriteria.countriesIso) %>%
##     group_by(studyId) %>%
##     mutate(country = paste0(selectionCriteria.countriesIso,
##                             collapse = "|")) %>%
##     select(studyId, country) %>% 
##     unique() %>%
##     separate_rows(country, sep = "\\|") %>%
##     unique()
## ## Same for ageMin
## mindmap_agemin <- mindmap_pop %>%
##     select(studyId, selectionCriteria.ageMin) %>%
##     group_by(studyId) %>%
##     summarize(age_min = min(selectionCriteria.ageMin))

## ## Variables
mindmap_var <- mindmap_var %>%
   select(studyId:dceId, Mlstr_additional.Source:Mlstr_social.Social_network)
mindmap_var <- select(mindmap_studies, c(id, acronym)) %>% 
   left_join(., mindmap_var, by = c("id" = "studyId")) %>%
   rename(studyId = "id")
area_of_info <- grep("area", names(mindmap_var), value = TRUE)
phys_meas <- grep("physmeas", names(mindmap_var), value = TRUE)
lab_meas <- grep("labmeas", names(mindmap_var), value = TRUE)
cog_scale <- grep("cogscale", names(mindmap_var), value = TRUE)
mindmap_var <- mindmap_var %>%
   select(studyId:Mlstr_additional.Target, area_of_info, phys_meas,
          lab_meas, cog_scale)

## area_overall <- mindmap_var %>%
##     select(acronym, area_of_info) %>% 
##     summarize_all(funs(sum(!is.na(.)))) %>%
##     gather(area, n) %>%
##     filter(area != "acronym")
## area_human <- c("Health status limitations", "Health care use",
##                 "Social environment", "Administrative information",
##                 "Socio-demographics", "Lifestyle behaviours",
##                 "Diseases", "Symptoms", 
##                 "Cognitive measures", "Non-pharma intervantions", 
##                 "Physical measures", "Reproduction", 
##                 "Life events", "Physical environment",
##                 "Medication suppl.", "Preschool/school work", 
##                 "Laboratory measures", "End of life")
## area_overall$area <- area_human

## #phys_overall <- mindmap_var %>%
## #    select(acronym, phys_meas) %>% 
## #    summarize_all(funs(sum(!is.na(.)))) %>%
## #    gather(area, n) %>%
## #    filter(area != "acronym")
## #phys_human <- c("Muscles/Skeleton", "Circulation/Respiration",
## #                "Anthropometry", "Sensory/pain",
## #                "Skin", "Other",
## #                "Brain/Nerves", "Physical characteristics")
## #phys_overall$area <- phys_human

## #lab_overall <- mindmap_var %>%
## #    select(acronym, lab_meas) %>% 
## #    summarize_all(funs(sum(!is.na(.)))) %>%
## #    gather(area, n) %>%
## #    filter(area != "acronym")
## #lab_human <- c("Genomics", "Biochemistry",
## #               "Hematology", "Virology",
## #               "Immunology", "Other",
## #               "Histology")
## #lab_overall$area <- lab_human

## cog_overall <- mindmap_var %>%
##     select(acronym, cog_scale) %>% 
##     summarize_all(funs(sum(!is.na(.)))) %>%
##     gather(area, n) %>%
##     filter(area != "acronym")
## cog_human <- c("Cognition", "Emotion",
##                "Other", "Personality")
## cog_overall$area <- cog_human

## area <- get_area(mindmap_var, "acronym", "area", "overall")
## area <- left_join(area, taxo %>%
##                         select(term, term.title) %>%
##                         rename(area = term))
## #area_phys <- get_area(mindmap_var, "acronym", "phys", "overall")
## #area_lab <- get_area(mindmap_var, "acronym", "lab", "overall")
## area_cog <- get_area(mindmap_var, "acronym", "cog", "overall")

# By study: count nbr of variables within an area
## area_studies <- get_area(mindmap_var, "acronym", "area", "studies")
## area_studies <- left_join(area_studies, taxo %>%
##                                         select(term, term.title) %>%
##                                         rename(area = term))
#area_studies_phys <- get_area(mindmap_var, "acronym", "phys", "studies")
#rea_studies_lab <- get_area(mindmap_var, "acronym", "lab", "studies")
mindmap_studies_cog <- get_area(mindmap_var, "acronym", "cog", "studies")

## Cog scales and studies
mindmap_by_cog_scale <- mindmap_var %>%
    select(acronym, cog_scale[1]) %>%
    unique()
## study_by_cog_emo <- mindmap_var %>%
##     select(acronym, cog_scale[2]) %>%
##     unique()
## study_by_cog_perso <- mindmap_var %>%
##     select(acronym, cog_scale[3]) %>%
##     unique()
## study_by_cog_psycho <- mindmap_var %>%
##     select(acronym, cog_scale[4]) %>%
##     unique()

#---eof-----------------------------------------------------------------------

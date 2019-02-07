## IALSA / ATHLOS / MINDMAP/ NEAR / COSMIC
## Get data from network
## JAN 2019

library(tidyverse)
library(micar)

## IALSA
## Get data from Mica
if (!file.exists("../../data/raw/IALSA_studies.rds") |
    !file.exists("../../data/raw/IALSA_pop.rds") |
    !file.exists("../../data/raw/IALSA_dce.rds") |
    !file.exists("../../data/raw/IALSA_var.rds") |
    !file.exists("../../data/raw/taxo.rds") |
    !file.exists("../../data/raw/taxo_cog.rds") |
    !file.exists("../../data/raw/taxo_habits.rds") |
    !file.exists("../../data/raw/taxo_genhealth.rds") |
    !file.exists("../../data/raw/taxo_social.rds")) {
    ## Open connection
    mica_connect <- mica.login(getPass::getPass(msg = "Your login!"),
                               getPass::getPass(msg = "Your password!"), 
                               url = "https://mica.maelstrom-research.org")
    ## Get IALSA studies
    ialsa_studies <- mica.studies(mica_connect, 
                                  query = "network(in(Mica_network.id,ialsa)),study(in(Mica_study.className,Study))",
                                  lim = 1000)
    saveRDS(ialsa_studies, "../../data/raw/IALSA_studies.rds")
    ## Get Populations
    ialsa_pop <- mica.study.populations(mica_connect,
                                        query = "network(in(Mica_network.id,ialsa))",
                                        lim = 1000)
    saveRDS(ialsa_pop, "../../data/raw/IALSA_pop.rds")
    ## Get DCEs
    ialsa_dce <- mica.study.dces(mica_connect, 
                                 query = "network(in(Mica_network.id,ialsa))",
                                 limit = 1000)
    saveRDS(ialsa_dce, "../../data/raw/IALSA_dce.rds")
    ## Get variables and area of information
    ialsa_var <- mica.variables(mica_connect, query = "network(in(Mica_network.id,ialsa))", limit = 1000000)
    saveRDS(ialsa_var, "../../data/raw/IALSA_var.rds")
    ## Taxo
    taxo <- mica.taxonomies(mica_connect,
                            target = "variable", locale = "en",
                            taxonomies = list("Mlstr_area"))
    saveRDS(taxo, "../../data/raw/taxo.rds")
    taxo_cog <- mica.taxonomies(mica_connect,
                                target = "variable", locale = "en",
                                taxonomies = list("Mlstr_cogscale"))
    saveRDS(taxo_cog, "../../data/raw/taxo_cog.rds")
    taxo_genhealth <- mica.taxonomies(mica_connect,
                                      target = "variable", locale = "en",
                                      taxonomies = list("Mlstr_genhealth"))
    saveRDS(taxo_genhealth, "../../data/raw/taxo_genhealth.rds")
    taxo_habits <- mica.taxonomies(mica_connect,
                                   target = "variable", locale = "en",
                                   taxonomies = list("Mlstr_habits"))
    saveRDS(taxo_habits, "../../data/raw/taxo_habits.rds")
    taxo_social <- mica.taxonomies(mica_connect,
                                   target = "variable", locale = "en",
                                   taxonomies = list("Mlstr_social"))
    saveRDS(taxo_social, "../../data/raw/taxo_social.rds")
    ## Close connection
    mica.logout(mica_connect)
}

ialsa_studies <- readRDS("../../data/raw/IALSA_studies.rds")
ialsa_pop <- readRDS("../../data/raw/IALSA_pop.rds")
ialsa_dce <- readRDS("../../data/raw/IALSA_dce.rds")
ialsa_var <- readRDS("../../data/raw/IALSA_var.rds")
taxo <- readRDS("../../data/raw/taxo.rds")
taxo_cog <- readRDS("../../data/raw/taxo_cog.rds")
taxo_genhealth <- readRDS("../../data/raw/taxo_genhealth.rds")
taxo_habits <- readRDS("../../data/raw/taxo_habits.rds")
taxo_social <- readRDS("../../data/raw/taxo_social.rds")

##########################################################################
## ATHLOS
## Get data from Mica
if (!file.exists("../../data/raw/ATHLOS_studies.rds") |
    !file.exists("../../data/raw/ATHLOS_pop.rds") |
    !file.exists("../../data/raw/ATHLOS_dce.rds") |
    !file.exists("../../data/raw/ATHLOS_var.rds")) {
    ## Open connection
    mica_connect <- mica.login(getPass::getPass(msg = "Your login!"),
                               getPass::getPass(msg = "Your password!"), 
                               url = "https://mica.maelstrom-research.org")
    ## Get ATHLOS studies
    athlos_studies <- mica.studies(mica_connect, 
                                  query = "network(in(Mica_network.id,athlos)),study(in(Mica_study.className,Study))",
                                  lim = 1000)
    saveRDS(athlos_studies, "../../data/raw/ATHLOS_studies.rds")
    ## Get Populations
    athlos_pop <- mica.study.populations(mica_connect,
                                        query = "network(in(Mica_network.id,athlos))",
                                        lim = 1000)
    saveRDS(athlos_pop, "../../data/raw/ATHLOS_pop.rds")
    ## Get DCEs
    athlos_dce <- mica.study.dces(mica_connect, 
                                 query = "network(in(Mica_network.id,athlos))",
                                 limit = 1000)
    saveRDS(athlos_dce, "../../data/raw/ATHLOS_dce.rds")
    ## Get variables and area of information
    athlos_var <- mica.variables(mica_connect, query = "network(in(Mica_network.id,athlos))", limit = 1000000)
    saveRDS(athlos_var, "../../data/raw/ATHLOS_var.rds")
    ## Close connection
    mica.logout(mica_connect)
}

athlos_studies <- readRDS("../../data/raw/ATHLOS_studies.rds")
athlos_pop <- readRDS("../../data/raw/ATHLOS_pop.rds")
athlos_dce <- readRDS("../../data/raw/ATHLOS_dce.rds")
athlos_var <- readRDS("../../data/raw/ATHLOS_var.rds")


##########################################################################
## MINDMAP
## Get data from Mica
if (!file.exists("../../data/raw/MINDMAP_studies.rds") |
    !file.exists("../../data/raw/MINDMAP_pop.rds") |
    !file.exists("../../data/raw/MINDMAP_dce.rds") |
    !file.exists("../../data/raw/MINDMAP_var.rds")) {
    ## Open connection
    mica_connect <- mica.login(getPass::getPass(msg = "Your login!"),
                               getPass::getPass(msg = "Your password!"), 
                               url = "https://mica.maelstrom-research.org")
    ## Get MINDMAP studies
    mindmap_studies <- mica.studies(mica_connect, 
                                  query = "network(in(Mica_network.id,mindmap)),study(in(Mica_study.className,Study))",
                                  lim = 1000)
    saveRDS(mindmap_studies, "../../data/raw/MINDMAP_studies.rds")
    ## Get Populations
    mindmap_pop <- mica.study.populations(mica_connect,
                                        query = "network(in(Mica_network.id,mindmap))",
                                        lim = 1000)
    saveRDS(mindmap_pop, "../../data/raw/MINDMAP_pop.rds")
    ## Get DCEs
    mindmap_dce <- mica.study.dces(mica_connect, 
                                 query = "network(in(Mica_network.id,mindmap))",
                                 limit = 1000)
    saveRDS(mindmap_dce, "../../data/raw/MINDMAP_dce.rds")
    ## Get variables and area of information
    mindmap_var <- mica.variables(mica_connect, query = "network(in(Mica_network.id,mindmap))", limit = 1000000)
    saveRDS(mindmap_var, "../../data/raw/MINDMAP_var.rds")
    ## Close connection
    mica.logout(mica_connect)
}

mindmap_studies <- readRDS("../../data/raw/MINDMAP_studies.rds")
mindmap_pop <- readRDS("../../data/raw/MINDMAP_pop.rds")
mindmap_dce <- readRDS("../../data/raw/MINDMAP_dce.rds")
mindmap_var <- readRDS("../../data/raw/MINDMAP_var.rds")


##########################################################################
## NEAR
## Get data from Mica
if (!file.exists("../../data/raw/NEAR_studies.rds") |
    !file.exists("../../data/raw/NEAR_pop.rds") |
    !file.exists("../../data/raw/NEAR_dce.rds") |
    !file.exists("../../data/raw/NEAR_var.rds")) {
    ## Open connection
    mica_connect <- mica.login(getPass::getPass(msg = "Your login!"),
                               getPass::getPass(msg = "Your password!"), 
                               url = "https://mica.maelstrom-research.org")
    ## Get NEAR studies
    near_studies <- mica.studies(mica_connect, 
                                  query = "network(in(Mica_network.id,near)),study(in(Mica_study.className,Study))",
                                  lim = 1000)
    saveRDS(near_studies, "../../data/raw/NEAR_studies.rds")
    ## Get Populations
    near_pop <- mica.study.populations(mica_connect,
                                        query = "network(in(Mica_network.id,near))",
                                        lim = 1000)
    saveRDS(near_pop, "../../data/raw/NEAR_pop.rds")
    ## Get DCEs
    near_dce <- mica.study.dces(mica_connect, 
                                 query = "network(in(Mica_network.id,near))",
                                 limit = 1000)
    saveRDS(near_dce, "../../data/raw/NEAR_dce.rds")
    ## Get variables and area of information
    near_var <- mica.variables(mica_connect, query = "network(in(Mica_network.id,near))", limit = 1000000)
    saveRDS(near_var, "../../data/raw/NEAR_var.rds")
    ## Close connection
    mica.logout(mica_connect)
}

near_studies <- readRDS("../../data/raw/NEAR_studies.rds")
near_pop <- readRDS("../../data/raw/NEAR_pop.rds")
near_dce <- readRDS("../../data/raw/NEAR_dce.rds")
near_var <- readRDS("../../data/raw/NEAR_var.rds")


##########################################################################
## COSMIC
## Get data from Mica
#if (!file.exists("../../data/raw/COSMIC_studies.rds") |
#    !file.exists("../../data/raw/COSMIC_pop.rds") |
#    !file.exists("../../data/raw/COSMIC_dce.rds") |
#    !file.exists("../../data/raw/COSMIC_var.rds")) {
#    ## Open connection
#    mica_connect <- mica.login(getPass::getPass(msg = "Your login!"),
#                               getPass::getPass(msg = "Your password!"), 
#                               url = "https://mica.maelstrom-research.org")
#    ## Get COSMIC studies
#    cosmic_studies <- mica.studies(mica_connect, 
#                                  query = "network(in(Mica_network.id,cosmic)),study(in(Mica_study.className,Study))",
#                                  lim = 1000)
#    saveRDS(cosmic_studies, "../../data/raw/COSMIC_studies.rds")
#    ## Get Populations
#    cosmic_pop <- mica.study.populations(mica_connect,
#                                        query = "network(in(Mica_network.id,cosmic))",
#                                        lim = 1000)
#    saveRDS(cosmic_pop, "../../data/raw/COSMIC_pop.rds")
#    ## Get DCEs
#    cosmic_dce <- mica.study.dces(mica_connect, 
#                                 query = "network(in(Mica_network.id,cosmic))",
#                                 limit = 1000)
#    saveRDS(cosmic_dce, "../../data/raw/COSMIC_dce.rds")
#    ## Get variables and area of information
#    cosmic_var <- mica.variables(mica_connect, query = "network(in(Mica_network.id,cosmic))", limit = 1000000)
#    saveRDS(cosmic_var, "../../data/raw/COSMIC_var.rds")
#    ## Close connection
#    mica.logout(mica_connect)
#}

#cosmic_studies <- readRDS("../../data/raw/COSMIC_studies.rds")
#cosmic_pop <- readRDS("../../data/raw/COSMIC_pop.rds")
#cosmic_dce <- readRDS("../../data/raw/COSMIC_dce.rds")
#cosmic_var <- readRDS("../../data/raw/COSMIC_var.rds")

#--eof-------------------------------------------------------------------

library(tidyverse)

tb <- read_csv('~/localRepos/meet_R/practice_data/tb.csv')

# make tidy
tb_tidy <- tb %>% 
  gather(key = code, value = count, -iso2, -year) %>% 
  separate(code, c("gender", "age"), sep = "_") %>% 
  filter(!is.na(count)) %>% 
  View("tb_tidy")

# with fill
tb_tidy %>% 
  filter(iso2 == "US") %>% 
  filter(!age %in% c("u", "014", "04", "514")) %>%
  ggplot(aes(x = year, y = count, fill = gender)) +
  geom_bar(stat = "identity", position = "fill") +
  facet_grid(~ age) +
  scale_fill_manual("",
                    values=c("#486030",
                             "#C03018"))

# sans fill
tb_tidy %>% 
  filter(iso2 == "US") %>% 
  filter(!age %in% c("u", "014", "04", "514")) %>%
  ggplot(aes(x = year, y = count, fill = gender)) +
  geom_bar(stat = "identity") +
  facet_grid(~ age) +
  scale_fill_manual("",
                    values=c("#486030",
                             "#C03018"))

# faceted by gender & age
tb_tidy %>% 
  filter(iso2 == "US") %>% 
  filter(!age %in% c("u", "014", "04", "514")) %>%
  ggplot(aes(x = year, y = count, fill = gender)) +
  geom_bar(stat = "identity") +
  facet_grid(gender ~ age) +
  scale_fill_manual("",
                    values=c("#486030",
                             "#C03018"))

# polar
tb_tidy %>% 
  filter(iso2 == "US") %>% 
  filter(!age %in% c("u", "014", "04", "514")) %>%
  ggplot(aes(x = year, y = count, fill = gender)) +
  geom_bar(stat = "identity") +
  facet_grid(gender ~ age) +
  scale_fill_manual("",
                    values=c("#486030",
                             "#C03018")) +
  coord_polar()
library(cfbfastR)
library(tidyverse)

pbp <- load_cfb_pbp(2021)

pbp_pac_def <- pbp %>%
  filter(defense_conference == "Pac-12",
         def_pos_team %in% c("Arizona", "Arizona State", "California", "Colorado", "Oregon", "Oregon State", "Stanford", "UCLA", "USC", "Utah", "Washington", "Washington State"),
         !(play_type %in% c("End of Half", "End of Game", "End Period", "End of Regulation", "Timeout", "Kickoff"))
  )

pbp_pac_off <- pbp %>%
  filter(offense_conference == "Pac-12",
         pos_team %in% c("Arizona", "Arizona State", "California", "Colorado", "Oregon", "Oregon State", "Stanford", "UCLA", "USC", "Utah", "Washington", "Washington State"),
         !(play_type %in% c("End of Half", "End of Game", "End Period", "End of Regulation", "Timeout", "Kickoff"))
  )

pac_drives <- pbp_pac_def %>%
  group_by(id_drive) %>%
  summarize(def_team = last(def_pos_team),
            off_team = last(pos_team),
            opp_conf = last(offense_conference),
            drive_result = last(drive_result),
            first_downs = sum(firstD_by_penalty) + sum(firstD_by_yards),
            plays = n(),
            play_type = last(play_type),
            play_text = last(play_text)
            )

pac_drives_filtered <- pac_drives %>%
  filter(!(drive_result %in% c("END OF HALF", "END OF GAME", "END OF 4TH QUARTER", "Uncategorized")),
         !((plays == 1) & !(play_type %in% c("Interception Return", "Fumble Recovery (Opponent)", "Rushing Touchdown", "Passing Touchdown", "Safety"))),
         !is.na(first_downs)
         )

pac_drives_filtered$three_and_out <- with(pac_drives_filtered, ifelse(((first_downs == 0) & (drive_result != "TD")), 1, 0))
pac_drives_filtered$td <- with(pac_drives_filtered, ifelse((drive_result == "TD"), 1, 0))
pac_drives_filtered$turnover <- with(pac_drives_filtered, ifelse((drive_result %in% c("DOWNS", "DOWNS TD", "FUMBLE", "FUMBLE RETURN TD", "FUMBLE TD", "INT", "INT TD")), 1, 0))

def_stats <- pac_drives_filtered %>%
  group_by(def_team) %>%
  summarize(total_drives = n(),
            three_and_out_rate = round((sum(three_and_out)/n()) * 100, 1),
            td_rate = round((sum(td)/n()) * 100, 1),
            turnover_rate = round((sum(turnover)/n()) * 100, 1)
            )

off_stats <- pac_drives_filtered %>%
  group_by(off_team) %>%
  summarize(total_drives = n(),
            three_and_out_rate = round((sum(three_and_out)/n()) * 100, 1),
            td_rate = round((sum(td)/n()) * 100, 1),
            turnover_rate = round((sum(turnover)/n()) * 100, 1)
  )

def_stats_2016$def_team <- paste(sep = " ", def_stats_2016$def_team, "(2016)")
off_stats_2016$off_team <- paste(sep = " ", off_stats_2016$off_team, "(2016)")

def_stats_2016 <- def_stats_2016 %>%
  filter(def_team == "Washington (2016)")
off_stats_2016 <- off_stats_2016 %>%
  filter(off_team == "Washington (2016)")

merged_off <- rbind(off_stats, off_stats_2016)
merged_def <- rbind(def_stats, def_stats_2016)

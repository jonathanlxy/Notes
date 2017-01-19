# Merge dataset by multiple keys
bigtable <- list(
  t1,
  t2,
  t3
) %>% Reduce(function(x, y) merge(x, y, by = c('userid', 'device'), all = T), .)

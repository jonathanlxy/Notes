# Difference between aggregate() and tapply()

While both two functions are used to group data and apply functions on each group,
the output of `aggregate()` and `tapply()` are different.

`aggregate()` is designed to group on multiple columns with one function and return a dataframe with __one row for each category__:
```
> with( CO2, aggregate(uptake, list(Plant, Type), sum) )

>    Plant        Type uptake
> 1    Qn1      Quebec  232.6
> 2    Qn2      Quebec  246.1
> 3    Qn3      Quebec  263.3
> 4    Qc1      Quebec  209.8
> 5    Qc3      Quebec  228.1
> 6    Qc2      Quebec  228.9
> 7    Mn3 Mississippi  168.8
> 8    Mn2 Mississippi  191.4
> 9    Mn1 Mississippi  184.8
> 10   Mc2 Mississippi   85.0
> 11   Mc3 Mississippi  121.1
> 12   Mc1 Mississippi  126.0
```

Meanwhile, __tapply()__ is designed to group on a single vector with results returned as a matrix or array:
```
> tapply(CO2$uptake, list(CO2$Plant, CO2$Type), sum)

>     Quebec Mississippi
> Qn1  232.6          NA
> Qn2  246.1          NA
> Qn3  263.3          NA
> Qc1  209.8          NA
> Qc3  228.1          NA
> Qc2  228.9          NA
> Mn3     NA       168.8
> Mn2     NA       191.4
> Mn1     NA       184.8
> Mc2     NA        85.0
> Mc3     NA       121.1
> Mc1     NA       126.0
```

Also, __aggregate()__ supports formula method, which __tapply()__ does not:

```
> aggregate(uptake~Plant+Type, data=CO2, sum)

>    Plant        Type uptake
> 1    Qn1      Quebec  232.6
> 2    Qn2      Quebec  246.1
> 3    Qn3      Quebec  263.3
> 4    Qc1      Quebec  209.8
> 5    Qc3      Quebec  228.1
> 6    Qc2      Quebec  228.9
> 7    Mn3 Mississippi  168.8
> 8    Mn2 Mississippi  191.4
> 9    Mn1 Mississippi  184.8
> 10   Mc2 Mississippi   85.0
> 11   Mc3 Mississippi  121.1
> 12   Mc1 Mississippi  126.0
```

In case of single variable grouping, __tapply()__ might be a better approach because the output looks more straightforward

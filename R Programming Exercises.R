data()


# Reading data 

readr
haven 
readxl

# 6 main verbs 
#filter()
#arrange()
#mutate()
#group_by()
#Summarise()


# Simple_Use 

library("tidyverse")
library("dplry")

# this a data set from R  
  
class(mtcars)
mtcars_tbl
head(mtcars, 5)
glimpse(mtcars)


# we want to know cyclinders that are 8 
mtcars
filter(mtcars, cyl == 8)


# we want to know cycl that are 4 and 6
mtcars%>%
  filter(cyl %in% c(4,6))


# We want to arrange in ascending order 

mtcars%>%
  arrange(desc(mpg))

# we can use the select to selcet only the variables 

mtcars %>%
  select(mpg,cyl,disp,hp,drat)%>%
  select(-mpg)
  

  # mutate function 
mtcars%>%
  mutate(cyl=factor(cyl,
                    levels=c(4, 6, 8),
                    labels=c("4 cyc", "6 Cyc", "7 cyc")))%>%
  select(cyl)
  

mtcars%>%
  mutate(miles_per_litre =mpg*3.991,
         miles_per_gallon=miles_per_litre/3.7861)%>%
  select(miles_per_litre,miles_per_gallon)%>%
  head(10)

### Group by 



mtcars%>%
  group_by(cyl)%>%
  filter(hp==max(hp))

#### Group and filter by ascending and min max hp ???

# summarise data 
mtcars%>%
  summarise(mean=mean(mpg))

mtcars%>%
  group_by(cyl)%>%
  summarise(mean_mpg=mean(mpg), sd_mpg=sd(mpg))


mtcars%>%
  group_by(cyl)%>%
  summarise_at(.vars = vars(mpg,disp,qsec),  .funs = mean)
               


######################## basics in ggplots how to plot using ggplot ###################
ggplot(data=BOD, 
       mapping=aes(x=Time,
                   y=demand))+
  geom_point()+
  geom_line(colour='red')



untidy_df





view(CO2)
names(CO2)

CO2 %>%
  ggplot(aes(conc, uptake, 
             colour=Treatment))+
  geom_point(size=3, alpha=0.5)+
  geom_smooth(method = lm, se=F)+
  facet_wrap(~Type)+
  labs(title = "concentration of co2")+
  theme_bw()




CO2 %>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(aes(size=conc,
                 colour=Plant))+
  facet_wrap(~Type)+
  theme_bw()+
  labs(title = "Chilled vs Non-chilled")


view(mpg)

mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ,cty))+
  geom_point(aes(colour=drv,
             size=trans), alpha=0.5)+
  geom_smooth()+
  facet_wrap(~year,nrow=1)+
  labs(x="Engine size",
       y="MPG in the city",
       title = "Fuel efficiency")+
  theme_bw()

df<-read_csv("Alzheimer_s_Disease_and_Healthy_Aging_Data.csv")
view(df)
names(df)




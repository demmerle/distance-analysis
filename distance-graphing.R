## Just going to try and graph a few .csvs from my data 
## first, check working directory, make sure everything's there
## then, import the packages you think you'll need - did this by selecting in the Rstudio workspace, but better to load them explicitly 

getwd()
## import the data you want 

read.csv("Ex18_20150614_K5230_WT_514_yes-dox_Isl1-594_Lhx3-488_DAPI_05_SIR_EAL_THR-data_1.csv
         ")
## check that it's legit
head("Ex18_20150614_K5230_WT_514_yes-dox_Isl1-594_Lhx3-488_DAPI_05_SIR_EAL_THR-data_1.csv")

## set it to a better name 
testdata <- read.csv("Ex18_20150614_K5230_WT_514_yes-dox_Isl1-594_Lhx3-488_DAPI_05_SIR_EAL_THR-data_1.csv")
head(testdata)

## Select out the fields you want
testdata %>%
  select(NN_dist, n_voxels) %>%
  head(5)

## calculate some stuff 
testdata %>%
  mean(NN_dist) %>%
  mean(n_voxels) %>%
  
## maybe try plotting something 
s = ggplot(testdata, aes(x=n_voxels, y=NN_dist)) +
  geom_point()
s

## not that hot - try reversing it 
s = ggplot(testdata, aes(x=NN_dist, y=n_voxels)) +
  geom_point()
s

## try graphing just NN_dist as a histogram
testdata_hist = ggplot(testdata, aes(NN_dist)) +
  geom_histogram(binwidth = 10)
testdata_hist

## now try with a bind width of 1 
testdata_hist = ggplot(testdata, aes(NN_dist)) +
  geom_histogram(binwidth = 1)
testdata_hist

#try getting a median 
median(testdata$NN_dist)
median(testdata$n_voxels)

# try plotting both as counts 
testdata_count = ggplot(testdata, aes(NN_dist, n_voxels)) +
  geom_count()
testdata_count

# try plotting both voxels and distances as a violin plot 
testdata_violin = ggplot(testdata, aes(n_voxels) )+
  geom_violin()
testdata_violin

testdata_point = ggplot(testdata, aes(NN_dist, n_voxels)) +
  geom_point() +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 20)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 20))

#try summarizing
summary(testdata$NN_dist)
summary(testdata$n_voxels)

## now try making a pipe structure for one file 
# pick a new file to do this on 
Ex18_KO_Isl1Lhx3_05 <- read.csv("Ex18_20150614_K5230_KO_514_yes-dox_Isl1-594_Lhx3-488_DAPI_05_SIR_EAL_THR-data_1.csv")dir.
head(Ex18_KO_Isl1Lhx3_05) #just check if everything is fine 
## now use some pipes
Ex18_KO_Isl1Lhx3_05 %>% #pipe to next command
select(NN_dist, n_voxels) %>% #selects only the relevant columns 
  head(5) %>%
  summary(Ex18_KO_Isl1Lhx3_05$NN_dist) %>%
  summary(Ex18_KO_Isl1Lhx3_05$n_voxels) %>%
  Ex18_KO_Isl1Lhx3_05_scatter = ggplot(Ex18_KO_Isl1Lhx3_05, aes(NN_dist, n_voxels)) +
  geom_point() +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 20)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 20))


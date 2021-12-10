# Data Preprocessing

# Importing the dataset
dataset = read.csv('Features data set.csv')


# Taking care of missing data
dataset$MarkDown1 = ifelse(is.na(dataset$MarkDown1),
                           ave(dataset$MarkDown1, FUN = function(x) mean(x, na.rm = TRUE)),
                           dataset$MarkDown1)
dataset$MarkDown2 = ifelse(is.na(dataset$MarkDown2),
                           ave(dataset$MarkDown2, FUN = function(x) mean(x, na.rm = TRUE)),
                           dataset$MarkDown2)
dataset$MarkDown3 = ifelse(is.na(dataset$MarkDown3),
                           ave(dataset$MarkDown3, FUN = function(x) mean(x, na.rm = TRUE)),
                           dataset$MarkDown3)
dataset$MarkDown4 = ifelse(is.na(dataset$MarkDown4),
                           ave(dataset$MarkDown4, FUN = function(x) mean(x, na.rm = TRUE)),
                           dataset$MarkDown4)
dataset$MarkDown5 = ifelse(is.na(dataset$MarkDown5),
                           ave(dataset$MarkDown5, FUN = function(x) mean(x, na.rm = TRUE)),
                           dataset$MarkDown5)
dataset$CPI = ifelse(is.na(dataset$CPI),
                           ave(dataset$CPI, FUN = function(x) mean(x, na.rm = TRUE)),
                           dataset$CPI)
dataset$Unemployment = ifelse(is.na(dataset$Unemployment),
                     ave(dataset$Unemployment, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Unemployment)


# Encoding categorical data
dataset$IsHoliday = factor(dataset$IsHoliday,
                           levels = c('FALSE', 'TRUE'),
                           labels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$IsHoliday, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
#training_set = scale(training_set)
training_set[, 3:9] = scale(training_set[, 3:9])
#test_set = scale(test_set)
test_set[, 3:9] = scale(test_set[, 3:9])





data = read.csv("./week13/public_util.txt", sep = " ", header = FALSE)
data

rows = data[1]
data = data[-1]

data[1:8,1:4]

km = kmeans(data[1:8,1:4], centers = 3, iter.max = 10, nstart = 1)
km

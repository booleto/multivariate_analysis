rm(list = ls())

#####################
### Bai 1

X = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
Y = c(1.5, 2.3, 3.2, 4.6, 5.4, 6.6, 7.6, 8.6, 9.1)

print(paste("Do dai vector X: ", length(X)))
print(paste("Do dai vector Y: ", length(Y)))

print(paste("X[2] = ", X[2]))
print(paste("Y[1, 4, 7] = ", Y[c(1, 4, 7)]))

X[4] = 215
X
Y[c(1, 5)] = c(99, 199)
Y

round(Y)

X + Y
5 * Y

### Bai 1
#####################

#####################
### Bai 2

A = matrix(c(1, 3, 2, 8, 2, 6, 4, 7, 1, 5, 3, 5, 3, 4, 2, 1), nrow = 4, ncol = 4, byrow = TRUE)
B = matrix(c(1, 4, 1, 4, 2, 1, 7, 6, 3, 5, 8, 3, 4, 3, 9, 7), nrow = 4, ncol = 4, byrow = TRUE)

rownames(A) = c("X", "Y", "Z", "T")
C = A

rowSums(B)
colSums(B)

rowMeans(B)
colMeans(B)

A[2, 3]

D = A[1:2,]
D

E = B[, -3]
E

t(A)

solve(A)

eigen(B)

det(B)

A * B

Z = A * solve(B)
Z

### Bai 2
#####################

#####################
### Bai 3

X = 1 - pnorm(2400, 2100, 200)
X

X = pnorm(2200, 2100, 200) - pnorm(1700, 2100, 200)
X


a = qnorm(p = 1 - 0.03, mean = 2100, sd = 200)
a

rands = rnorm(n = 1000, mean = 2100, sd = 200)
hist(rands)

### Bai 3
#####################

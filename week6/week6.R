# ...

invest = read.table("./week6/investment.txt", sep = " ", header = TRUE)

# Dựa vào ma trận tải trọng các vecto riêng, có thể biểu diễn các thành phần chính theo các biến ban đầu
# Y_1 = 0.706*S.US + 0.114B.US - 0.109*B.Non.US - 0.686*A.Native

# Có thể thấy các thành phần chính được biểu diễn chủ yếu từ 2 bến S.US và A.Native
# Sử dụng ma trận hiệp phương sai khi các biến trong bộ dữ liệu có cùng thang đo
# Khi các biến trong bộ dữ liệu khác thang đo, ta dùng ma trận tương quan

pcacor = princomp(covmat = cor(invest[2:9]))
#pcacor = princomp(invest, cor = TRUE)
pc = princomp(invest[2:9])

# Vẽ và giải thích biểu đồ 8.1, 8.2
screeplot(x = pc, col = "red", pch = 16, type = "lines", cex = 2, lwd = 2, main = "")


# col là màu
# cex là độ lớn cho quan sát và tên biến
biplot(pc, col = c(2, 3), cex = c(.4, 1),
       xlim = c(-.45, .45), # Độ rộng trục Ox
       xlab = "First principal component", # Tên trục Ox
       ylab = "Second principal component", # Tên trục Oy
       main = "Biplot for investment allocations" # Tên biểu đồ
)

# Dựa vào đồ thị biplot, có thể thấy TPC thứ nhất được biểu diễn chủ yếu từ 2 biến A.native và S.US, TPC thứ 2 được biểu diễn chủ yếu từ biến B.US




hemangioma = read.table("./week6/hemangioma.txt", sep = " ", header = TRUE)
head(hemangioma)

f = factanal(x = hemangioma, factors = 3) # factor là số nhân tố khi phân tách
f$uniqueness

# X_i = sum(l_ij * F_j) + psi
# psi được gọi là nhiễu/sai số
f$loadings

# Ma trận tải trọng cho biết mỗi nhân tố chi phối những biến nào? Mỗi biến bị chi phối bởi những nhân tố nào?
# Ma trận tải trọng giúp biểu diễn các biến theo các nhân tố

# Age = -.168 * F3
# F1 chi phối chủ yếu các biến C.Myc, EZH, TGF.2
# Test of the hypothesis that 3 factors are sufficient
# The chi-square statistic í 8.03 on 7 degrees of freedom

# Bài toán kiểm định: H0: 3 nhân tố là đủ vs H1: 3 nhân tố là không đủ
# Do p-value = 0.33 > 0.05 nên chấp nhận H0. Có thể nói 3 nhân tố là đủ

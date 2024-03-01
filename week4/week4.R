library(mvtnorm)

# Sinh ngẫu nhiên biến 2 chiều theo phân phối chuẩn
set.seed(12345)
rvn = rmvnorm(n = 5, mean = c(0, 0), sigma = matrix(c(1, .8, .8, 1), 2, 2))

rvn

# Trung bình mẫu
colMeans(rvn)

# Ma trận hiệp phương sai mẫu
cov(rvn)

# Ma trận tương quan mẫu
cor(rvn)

# Kiểm định phân phối chuẩn
shapiro.test(rvn[,1])
shapiro.test(rvn[,2])

# 2. KIỂM ĐỊNH GIÁ TRỊ TRUNG BÌNH 2 MẪU 1 CHIỀU

#install.packages("ICSNP")
library(ICSNP)
data(LASERI) # Data về phản ứng của tim mạch khi nghiêng đầu
View(LASERI)
help(package = ICSNP)
?LASERI

## Test thống kê trong phân phối chuẩn 1 chiều, xét bnn tuân theo pp chuẩn
# 1 mẫu, 2 mẫu: t.test()
## 1. Kiểm định xem giá trị tỉng bình của biến HRTI tỏng LASERI có bằng 70 ko?
?t.test()
t.test(LASERI$HRT1, mu = 70)

# output:
#One Sample t-test

#data:  LASERI$HRT1
#t = -8.6833, df = 222, p-value = 8.418e-16
#alternative hypothesis: true mean is not equal to 70
#95 percent confidence interval (khoảng tin cậy 95%)
#  63.19398 65.71185
#sample estimates: (ước lượng điểm, GTTB mẫu)
#  mean of x 
#64.45291 

# Bài toán: H0 = mu_HRT1 = 70 vs H1: HRT1 != 70: dùng p-value để kiểm định
# Với mức ý nghĩa 5%, có cơ sở để nói GTTB của HRT1 khác 70

attach(LASERI) #tách dữ liệu, ko cần phải $ nữa

mean(HRT2)

# KĐ XEM GTTB CỦA HRT2 CÓ > 75 KO? MỨC Ý NGHĨA 1%
t.test(HRT2, alternative = c("greater"), mu = 75, conf.level = 0.99)

# KĐ XEM GTTB CỦA HRT2 CÓ < 78 KO? MỨC Ý NGHĨA 10%
t.test(HRT2, alternative = c("less"), mu = 78, conf.level = 0.9)

# KĐ XEM GTTB CỦA HRT1 và HRT2 CÓ KHÁC NHAU KHÔNG? MYN 1%
t.test(HRT1, HRT2)

# VỚI MỨC Ý NGHĨA 2%, CÓ CƠ SỞ ĐỂ NÓI GTTB CỦA HRT1 THỰC SỰ NHỎ HƠN HRT2 KO?
t.test(HRT1, HRT2, alternative = "less", conf.level = 0.98)
# H0: E(HRT1) = E(HRT2)
# H1: E(HRT1) < E(HRT2)


## Dùng hàm HoltellingsT2 để kiểm định xem GTTB của:
# 1. (HRT1T4, COT1T4, SVRIT1T4, PWVT1T4) có thực sự khác (0, 0, 0, 0) ko
# 2. (HRT1, COT1, SVRIT1, PWVT1) có khác (HRT4, COT4, SVRIT4, PWVT4) k?

HotellingsT2(data.frame(HRT1T4, COT1T4, SVRIT1T4, PWVT1T4), mu = c(0, 0, 0, 0)) # dùng cbind thay data.frame cũng được
# H0: E(X) = (0, 0, 0, 0)
# H1: E(X) != (0, 0, 0, 0)

HotellingsT2(data.frame(HRT1, COT1, SVRIT1, PWVT1), data.frame(HRT4, COT4, SVRIT4, PWVT4))
# H0: E(X_1) = E(X_2)
# H1: E(X_1) != E(X_2)
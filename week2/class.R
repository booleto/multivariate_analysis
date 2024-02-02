rm(list = ls())

# install.packages("MASS")
library(MASS)
names(Boston)


model = lm(medv ~ lstat, data = Boston)

summary(model)

# Phần dư Residuals: e = y - y_h, trong đó y là giá trị medv thực (được cho trong bộ dữ liệu)
# y_h là giá trị medv được dự đoán trong mô hình

# Bài toán kiểm định: Phần dư có tuân theo phân phối chuẩn không và gtri trung bình của phần dư có bằng 0 ko
shapiro.test(model$residuals) # Kiểm tra phần dư có tuân theo pp chuẩn ko
# H0: Phần dư tuân theo pp chuẩn vs H1: phần dư k tuân theo pp chuẩn
# Do p-value < 2.2e-16 < 0.05 nên bác bỏ H0
# Với mức ý nghĩa 5%, có cơ sở để nói phần dư k tuân theo pp chuẩn

# Nếu phần dư có pp chuẩn thì dùng t.test để kiểm định gttb
t.test(model$residuals, mu = 0)
t.test(model$residuals, mu = 2)

# Nếu phần dư k có pp chuẩn thì dùng wilcox.test để kiểm định gttb
wilcox.test((model$residuals)^2) # H0: E_e = 0 vs H1: E_e != 0

# Hệ số: ước lượng, sai số chuẩn, test thống kê T (t value), p-value (Pr(>|t|))
# Bài toán kiểm định hệ số: medv = a + b * lstat
# Bt 1: H0: a = 0 vs H1: a != 0
# Bt 2: H0: b = 0 vs H1: b != 0

wilcox.test(model$residuals) # nếu e ko chuẩn

# H0: EX = 0 vs H1: EX != 0
lstat = Boston$lstat
medv = Boston$medv
model = lm(medv ~ lstat)
confint(model) #KTC 95% cho các hệ số trong mô hình hồi quy
confint(model, level = 0.99)

predict(model, data.frame (lstat=(c(5, 10, 15))), interval = "confidence") # đưa ra gtri dự đoán

# dev.off()
plot(lstat, medv)
abline(model)
abline(model, lwd=3, col="red")
model$coefficients
abline(model, lwd=3)
abline(model, lwd=3, col="red")
plot(lstat, medv, col="red")
plot(lstat, medv, pch= ".")
plot(1:20, 1:20, pch=1:20)

par(mfrow = c(2,2))
plot(model)

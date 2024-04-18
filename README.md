# Multivariate Statistical Analysis

## Các nội dung quan trọng

### Hướng dẫn

Xem hướng dẫn sử dụng câu lệnh:

```
?<câu lệnh>
```

Tìm kiếm hướng dẫn sử dụng câu lệnh:

```
??<câu lệnh>
```

**NOTE:** Nếu không biết câu lệnh ở thư viện nào, chạy `??<câu lệnh>` để tìm thư viện.

### Câu lệnh chung

Trung bình mẫu

```
colMeans(data)
```

Ma trận hiệp phương sai mẫu

```
cov(data)
```

Ma trận tương quan mẫu

```
cor(data)
```

Tương quan giữa 2 biến

```
cor(a, b)
```

### Sinh mẫu ngẫu nhiên

Sinh ngẫu nhiên biến 2 chiều theo phân phối chuẩn

```
library(mvtnorm)

rvn = rmvnorm(n = 5, mean = c(0, 0), sigma = matrix(c(1, .8, .8, 1), 2, 2))
```

### Kiểm tra phân phối chuẩn

Kiểm tra biến có tuân theo phân phối chuẩn hay không:

```
shapiro.test(data)
```

- H0: data có phân phối chuẩn

- H1: data không có phân phối chuẩn


Nếu p-value > 0.05 => không có cơ sở bác bỏ H0. `data` tuân theo phân phối chuẩn.

Nếu p-value < 0.05 => bác bỏ H0. `data` không tuân theo phân phối chuẩn.


### Kiểm tra giá trị trung bình

#### Với 1 biến:

Kiểm tra xem GTTB của `data` có bằng `m` hay không, với độ tin cậy `a`:

```
t.test(data, mu = m, conf.level = a)
```

- H0: GTTB = m

- H1: GTTB != m

Nếu pvalue > 0.05 thì chấp nhận H0. GTTB = 0

Nếu pvalue < 0.05 thì bác bỏ H0. GTTB != 0

Nếu kiểm tra lớn hơn/nhỏ hơn, thêm tham số alternative: 

```
t.test(data, alternative = c("greater"), mu = m, conf.level = a)
```

So sánh GTTB 2 biến:

```
t.test(data1, data2)
```

#### Với nhiều biến:

Kiểm tra các biến `a`, `b`, `c`, `d` có thực sự khác 0 không:

```
HotellingsT2(data.frame(a, b, c, d), mu = c(0, 0, 0, 0))
```

Kiểm tra các biến `a`, `b`, `c`, `d` có thực sự khác `x`, `y`, `z`, `t` không:

```
HotellingsT2(data.frame(a, b, c, d), data.frame(x, y, z, t))
```

### Kiểm tra tương quan

```
dwtest(data)
```

- H0: data không có tương quan

- H1: data có tương quan

Nếu pvalue > 0.05, bác bỏ H0. `data` có tương quan

Nếu pvalue < 0.05, không đủ cơ sở để bác bỏ H0. `data` không tương quan


### Phân tích thành phần chính (PCA)

PCA bằng dữ liệu

```
pc = princomp(data)
```

PCA bằng ma trận hiệp phương sai khi các biến trong bộ dữ liệu có cùng thang đo

```
pc = princomp(covmat = cov(data))
```

Khi các biến trong bộ dữ liệu khác thang đo, dùng ma trận tương quan

```
pc = princomp(covmat = cor(data))
```

In kết quả:

```
summary(pc)
```

Vẽ biểu đồ tầm quan trọng của các thành phần chính: 

```
screeplot(x = pc, col = "red", pch = 16, type = "lines", cex = 2, lwd = 2, main = "")
```

Vẽ biểu đồ loadings của các thành phần chính:

```
# col là màu
# cex là độ lớn cho quan sát và tên biến
biplot(pc, col = c(2, 3), cex = c(.4, 1),
       xlim = c(-.45, .45), # Độ rộng trục Ox
       xlab = "First principal component", # Tên trục Ox
       ylab = "Second principal component", # Tên trục Oy
       main = "Biplot for investment allocations" # Tên biểu đồ
)
```


### Phân tích nhân tố

Phân tích nhân tố của data với số nhân tố m

```
factanal(data, factors = m)
```

Dùng ma trận hiệp phương sai/ma trận tương quan

```
factanal(factors = m, covmat = cor(data))
```

### Hồi quy tuyến tính
